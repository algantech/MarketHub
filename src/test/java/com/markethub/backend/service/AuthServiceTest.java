package com.markethub.backend.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.markethub.backend.audit.AuditService;
import com.markethub.backend.domain.User;
import com.markethub.backend.domain.UserType;
import com.markethub.backend.dto.request.LoginRequest;
import com.markethub.backend.exception.UnauthorizedException;
import com.markethub.backend.mapper.AuthMapper;
import com.markethub.backend.mapper.UserMapper;
import com.markethub.backend.repository.UserRepository;
import com.markethub.backend.security.JwtService;
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
    private PasswordEncoder passwordEncoder;
    @Mock
    private JwtService jwtService;
    @Mock
    private AuditService auditService;

    private AuthService authService;

    @BeforeEach
    void setUp() {
        authService = new AuthService(
            userRepository,
            passwordEncoder,
            jwtService,
            new AuthMapper(new UserMapper()),
            new UserMapper(),
            auditService
        );
    }

    @Test
    void loginReturnsTokenForActiveUser() {
        User user = buildUser();
        when(userRepository.findByUsernameIgnoreCase("tahir")).thenReturn(Optional.of(user));
        when(passwordEncoder.matches("HGS71mw9", "encoded")).thenReturn(true);
        when(jwtService.generateToken(org.mockito.ArgumentMatchers.any())).thenReturn("jwt-token");

        var response = authService.login(new LoginRequest("tahir", "HGS71mw9"), 3600);

        assertThat(response.accessToken()).isEqualTo("jwt-token");
        assertThat(response.user().username()).isEqualTo("tahir");
        verify(auditService).recordLoginSuccess(user);
    }

    @Test
    void loginThrowsUnauthorizedForWrongPassword() {
        User user = buildUser();
        when(userRepository.findByUsernameIgnoreCase("tahir")).thenReturn(Optional.of(user));
        when(passwordEncoder.matches("wrong-pass", "encoded")).thenReturn(false);

        assertThatThrownBy(() -> authService.login(new LoginRequest("tahir", "wrong-pass"), 3600))
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
