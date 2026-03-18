package com.markethub.backend.service;

import com.markethub.backend.domain.User;
import com.markethub.backend.dto.request.LoginRequest;
import com.markethub.backend.dto.response.CurrentUserResponse;
import com.markethub.backend.dto.response.LoginResponse;
import com.markethub.backend.exception.UnauthorizedException;
import com.markethub.backend.repository.UserRepository;
import com.markethub.backend.security.AuthenticatedUser;
import com.markethub.backend.security.JwtService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class AuthService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    public AuthService(
        UserRepository userRepository,
        PasswordEncoder passwordEncoder,
        JwtService jwtService
    ) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
    }

    public LoginResponse login(LoginRequest request, long expirationSeconds) {
        String normalizedUsername = normalizeUsername(request.username());

        User user = userRepository.findByUsernameIgnoreCase(normalizedUsername)
            .orElseThrow(() -> new UnauthorizedException("Kullanici adi veya sifre hatali"));

        if (!user.isActive() || !passwordEncoder.matches(request.password(), user.getPasswordHash())) {
            throw new UnauthorizedException("Kullanici adi veya sifre hatali");
        }

        AuthenticatedUser principal = AuthenticatedUser.from(user);
        String token = jwtService.generateToken(principal);

        return new LoginResponse(
            token,
            "Bearer",
            expirationSeconds,
            new CurrentUserResponse(
                principal.getId(),
                principal.getUsername(),
                principal.getFullName(),
                principal.getEmail(),
                principal.getUserType(),
                principal.getCompanyId(),
                principal.getRoles()
            )
        );
    }

    public CurrentUserResponse me(AuthenticatedUser user) {
        return new CurrentUserResponse(
            user.getId(),
            user.getUsername(),
            user.getFullName(),
            user.getEmail(),
            user.getUserType(),
            user.getCompanyId(),
            user.getRoles()
        );
    }

    private String normalizeUsername(String username) {
        if (!StringUtils.hasText(username)) {
            return username;
        }
        return username.trim().toLowerCase();
    }
}
