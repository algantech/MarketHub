package com.markethub.backend.service;

import com.markethub.backend.audit.AuditService;
import com.markethub.backend.domain.User;
import com.markethub.backend.dto.request.LoginRequest;
import com.markethub.backend.dto.response.CurrentUserResponse;
import com.markethub.backend.dto.response.LoginResponse;
import com.markethub.backend.exception.UnauthorizedException;
import com.markethub.backend.mapper.AuthMapper;
import com.markethub.backend.mapper.UserMapper;
import com.markethub.backend.repository.UserRepository;
import com.markethub.backend.security.AuthenticatedUser;
import com.markethub.backend.security.JwtService;
import com.markethub.backend.util.NormalizationUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    private static final Logger log = LoggerFactory.getLogger(AuthService.class);

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthMapper authMapper;
    private final UserMapper userMapper;
    private final AuditService auditService;

    public AuthService(
        UserRepository userRepository,
        PasswordEncoder passwordEncoder,
        JwtService jwtService,
        AuthMapper authMapper,
        UserMapper userMapper,
        AuditService auditService
    ) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
        this.authMapper = authMapper;
        this.userMapper = userMapper;
        this.auditService = auditService;
    }

    public LoginResponse login(LoginRequest request, long expirationSeconds) {
        String normalizedUsername = NormalizationUtils.normalizeUsername(request.username());

        User user = userRepository.findByUsernameIgnoreCase(normalizedUsername)
            .orElseThrow(() -> unauthorized(normalizedUsername));

        if (!user.isActive() || !passwordEncoder.matches(request.password(), user.getPasswordHash())) {
            throw unauthorized(normalizedUsername);
        }

        AuthenticatedUser principal = AuthenticatedUser.from(user);
        String token = jwtService.generateToken(principal);
        auditService.recordLoginSuccess(user);
        log.info("Login success for username={}, userType={}", user.getUsername(), user.getUserType());

        return authMapper.toLoginResponse(token, expirationSeconds, principal);
    }

    public CurrentUserResponse me(AuthenticatedUser user) {
        return userMapper.toCurrentUserResponse(user);
    }

    private UnauthorizedException unauthorized(String username) {
        auditService.recordLoginFailure(username);
        log.warn("Login failure for username={}", username);
        return new UnauthorizedException("Kullanici adi veya sifre hatali");
    }
}
