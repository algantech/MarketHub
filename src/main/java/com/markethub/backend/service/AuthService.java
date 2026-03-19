package com.markethub.backend.service;

import com.markethub.backend.audit.AuditService;
import com.markethub.backend.config.JwtProperties;
import com.markethub.backend.domain.RefreshToken;
import com.markethub.backend.domain.Role;
import com.markethub.backend.domain.User;
import com.markethub.backend.domain.UserType;
import com.markethub.backend.dto.request.LoginRequest;
import com.markethub.backend.dto.request.LogoutRequest;
import com.markethub.backend.dto.request.RefreshTokenRequest;
import com.markethub.backend.dto.response.CurrentUserResponse;
import com.markethub.backend.dto.response.LoginResponse;
import com.markethub.backend.dto.response.RolesResponse;
import com.markethub.backend.exception.UnauthorizedException;
import com.markethub.backend.mapper.AuthMapper;
import com.markethub.backend.mapper.UserMapper;
import com.markethub.backend.repository.RefreshTokenRepository;
import com.markethub.backend.repository.UserRepository;
import com.markethub.backend.security.AuthenticatedUser;
import com.markethub.backend.security.JwtService;
import com.markethub.backend.util.NormalizationUtils;
import com.markethub.backend.util.TokenUtils;
import java.time.Instant;
import java.util.Set;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    private static final Logger log = LoggerFactory.getLogger(AuthService.class);

    private final UserRepository userRepository;
    private final RefreshTokenRepository refreshTokenRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final JwtProperties jwtProperties;
    private final AuthMapper authMapper;
    private final UserMapper userMapper;
    private final AuditService auditService;

    public AuthService(
        UserRepository userRepository,
        RefreshTokenRepository refreshTokenRepository,
        PasswordEncoder passwordEncoder,
        JwtService jwtService,
        JwtProperties jwtProperties,
        AuthMapper authMapper,
        UserMapper userMapper,
        AuditService auditService
    ) {
        this.userRepository = userRepository;
        this.refreshTokenRepository = refreshTokenRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
        this.jwtProperties = jwtProperties;
        this.authMapper = authMapper;
        this.userMapper = userMapper;
        this.auditService = auditService;
    }

    public LoginResponse login(LoginRequest request) {
        String normalizedUsername = NormalizationUtils.normalizeUsername(request.username());
        revokeExpiredRefreshTokens();

        User user = userRepository.findByUsernameIgnoreCase(normalizedUsername)
            .orElseThrow(() -> unauthorized(normalizedUsername));

        if (!user.isActive() || !passwordEncoder.matches(request.password(), user.getPasswordHash())) {
            throw unauthorized(normalizedUsername);
        }

        AuthenticatedUser principal = AuthenticatedUser.from(user);
        String sessionId = UUID.randomUUID().toString();
        String accessToken = jwtService.generateAccessToken(principal, sessionId);
        String refreshToken = issueRefreshToken(user, sessionId);

        auditService.recordLoginSuccess(user);
        log.info("Login success for username={}, userType={}", user.getUsername(), user.getUserType());

        return authMapper.toLoginResponse(
            accessToken,
            refreshToken,
            jwtProperties.getAccessExpirationSeconds(),
            jwtProperties.getRefreshExpirationSeconds(),
            principal
        );
    }

    public LoginResponse refresh(RefreshTokenRequest request) {
        revokeExpiredRefreshTokens();
        String rawToken = request.refreshToken().trim();

        RefreshToken storedToken = refreshTokenRepository.findByTokenHash(TokenUtils.sha256(rawToken))
            .orElseThrow(() -> new UnauthorizedException("Refresh token gecersiz"));

        if (storedToken.isRevoked() || storedToken.getExpiresAt().isBefore(Instant.now())) {
            throw new UnauthorizedException("Refresh token gecersiz");
        }

        User user = userRepository.findById(storedToken.getUserId())
            .orElseThrow(() -> new UnauthorizedException("Kullanici bulunamadi"));

        if (!user.isActive()) {
            throw new UnauthorizedException("Kullanici pasif");
        }

        revokeToken(storedToken);

        AuthenticatedUser principal = AuthenticatedUser.from(user);
        String accessToken = jwtService.generateAccessToken(principal, storedToken.getSessionId());
        String refreshToken = issueRefreshToken(user, storedToken.getSessionId());

        auditService.recordTokenRefresh(user, storedToken.getSessionId());
        log.info("Token refresh success for username={}, sessionId={}", user.getUsername(), storedToken.getSessionId());

        return authMapper.toLoginResponse(
            accessToken,
            refreshToken,
            jwtProperties.getAccessExpirationSeconds(),
            jwtProperties.getRefreshExpirationSeconds(),
            principal
        );
    }

    public void logout(LogoutRequest request, AuthenticatedUser principal) {
        revokeExpiredRefreshTokens();
        String rawRefreshToken = request == null ? null : NormalizationUtils.trimToNull(request.refreshToken());

        if (rawRefreshToken != null) {
            refreshTokenRepository.findByTokenHash(TokenUtils.sha256(rawRefreshToken))
                .ifPresent(token -> {
                    revokeToken(token);
                    auditService.recordLogout(token.getUserId(), token.getUsername(), token.getUserType(), token.getSessionId());
                    log.info("Logout success for username={}, sessionId={}", token.getUsername(), token.getSessionId());
                });
            return;
        }

        if (principal != null) {
            refreshTokenRepository.findAllByUserIdAndRevokedFalse(principal.getId())
                .forEach(token -> {
                    revokeToken(token);
                    auditService.recordLogout(principal.getId(), principal.getUsername(), principal.getUserType(), token.getSessionId());
                });
            log.info("Logout success for username={}, all active sessions revoked", principal.getUsername());
        }
    }

    public CurrentUserResponse me(AuthenticatedUser user) {
        return userMapper.toCurrentUserResponse(user);
    }

    public RolesResponse getRoles(AuthenticatedUser user) {
        return new RolesResponse(
            user.getUserType(),
            Set.of(Role.COMPANY_ADMIN, Role.VIEWER),
            Set.of(UserType.SYSTEM_ADMIN, UserType.COMPANY_USER)
        );
    }

    private UnauthorizedException unauthorized(String username) {
        auditService.recordLoginFailure(username);
        log.warn("Login failure for username={}", username);
        return new UnauthorizedException("Kullanici adi veya sifre hatali");
    }

    private String issueRefreshToken(User user, String sessionId) {
        String rawToken = TokenUtils.generateOpaqueToken();

        RefreshToken refreshToken = new RefreshToken();
        refreshToken.setTokenHash(TokenUtils.sha256(rawToken));
        refreshToken.setSessionId(sessionId);
        refreshToken.setUserId(user.getId());
        refreshToken.setUsername(user.getUsername());
        refreshToken.setUserType(user.getUserType());
        refreshToken.setCompanyId(user.getCompanyId());
        refreshToken.setRevoked(false);
        refreshToken.setCreatedAt(Instant.now());
        refreshToken.setLastUsedAt(Instant.now());
        refreshToken.setExpiresAt(Instant.now().plusSeconds(jwtProperties.getRefreshExpirationSeconds()));

        refreshTokenRepository.save(refreshToken);
        return rawToken;
    }

    private void revokeToken(RefreshToken refreshToken) {
        refreshToken.setRevoked(true);
        refreshToken.setRevokedAt(Instant.now());
        refreshToken.setLastUsedAt(Instant.now());
        refreshTokenRepository.save(refreshToken);
    }

    private void revokeExpiredRefreshTokens() {
        refreshTokenRepository.findAllByExpiresAtBeforeAndRevokedFalse(Instant.now())
            .forEach(this::revokeToken);
    }
}
