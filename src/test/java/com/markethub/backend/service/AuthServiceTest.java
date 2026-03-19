package com.markethub.backend.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.markethub.backend.audit.AuditService;
import com.markethub.backend.config.JwtProperties;
import com.markethub.backend.domain.RefreshToken;
import com.markethub.backend.domain.User;
import com.markethub.backend.domain.UserType;
import com.markethub.backend.dto.request.LoginRequest;
import com.markethub.backend.exception.UnauthorizedException;
import com.markethub.backend.mapper.AuthMapper;
import com.markethub.backend.mapper.UserMapper;
import com.markethub.backend.repository.RefreshTokenRepository;
import com.markethub.backend.repository.UserRepository;
import com.markethub.backend.security.JwtService;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

@ExtendWith(MockitoExtension.class)
class AuthServiceTest {

    @Mock
    private UserRepository userRepository;
    @Mock
    private RefreshTokenRepository refreshTokenRepository;
    @Mock
    private PasswordEncoder passwordEncoder;
    @Mock
    private JwtService jwtService;
    @Mock
    private AuditService auditService;

    private AuthService authService;
    private JwtProperties jwtProperties;

    @BeforeEach
    void setUp() {
        jwtProperties = new JwtProperties();
        jwtProperties.setAccessExpirationSeconds(900);
        jwtProperties.setRefreshExpirationSeconds(604800);

        authService = new AuthService(
            userRepository,
            refreshTokenRepository,
            passwordEncoder,
            jwtService,
            jwtProperties,
            new AuthMapper(new UserMapper()),
            new UserMapper(),
            auditService
        );

        when(refreshTokenRepository.findAllByExpiresAtBeforeAndRevokedFalse(any())).thenReturn(List.of());
        when(refreshTokenRepository.save(any(RefreshToken.class))).thenAnswer(invocation -> invocation.getArgument(0));
    }

    @Test
    void loginReturnsTokenForActiveUser() {
        User user = buildUser();
        when(userRepository.findByUsernameIgnoreCase("tahir")).thenReturn(Optional.of(user));
        when(passwordEncoder.matches("HGS71mw9", "encoded")).thenReturn(true);
        when(jwtService.generateAccessToken(any(), anyString())).thenReturn("jwt-token");

        var response = authService.login(new LoginRequest("tahir", "HGS71mw9"));

        assertThat(response.accessToken()).isEqualTo("jwt-token");
        assertThat(response.refreshToken()).isNotBlank();
        assertThat(response.user().username()).isEqualTo("tahir");
        verify(auditService).recordLoginSuccess(user);
    }

    @Test
    void loginThrowsUnauthorizedForWrongPassword() {
        User user = buildUser();
        when(userRepository.findByUsernameIgnoreCase("tahir")).thenReturn(Optional.of(user));
        when(passwordEncoder.matches("wrong-pass", "encoded")).thenReturn(false);

        assertThatThrownBy(() -> authService.login(new LoginRequest("tahir", "wrong-pass")))
            .isInstanceOf(UnauthorizedException.class)
            .hasMessage("Kullanici adi veya sifre hatali");

        verify(auditService).recordLoginFailure("tahir");
    }

    private User buildUser() {
        User user = new User();
        user.setId("user-1");
        user.setUsername("tahir");
        user.setPasswordHash("encoded");
        user.setFullName("Tahir Admin");
        user.setEmail("tahir@example.com");
        user.setActive(true);
        user.setUserType(UserType.SYSTEM_ADMIN);
        user.setRoles(Set.of());
        return user;
    }
}
