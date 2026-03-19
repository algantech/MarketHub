package com.markethub.backend.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.markethub.backend.audit.AuditService;
import com.markethub.backend.domain.Role;
import com.markethub.backend.domain.User;
import com.markethub.backend.domain.UserType;
import com.markethub.backend.dto.request.CreateUserRequest;
import com.markethub.backend.dto.request.UpdateUserRequest;
import com.markethub.backend.exception.DuplicateResourceException;
import com.markethub.backend.mapper.UserMapper;
import com.markethub.backend.repository.CompanyRepository;
import com.markethub.backend.repository.UserRepository;
import java.time.Instant;
import java.util.Optional;
import java.util.Set;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

@ExtendWith(MockitoExtension.class)
class UserServiceTest {

    @Mock
    private UserRepository userRepository;
    @Mock
    private CompanyRepository companyRepository;
    @Mock
    private PasswordEncoder passwordEncoder;
    @Mock
    private AuditService auditService;

    private UserService userService;

    @BeforeEach
    void setUp() {
        userService = new UserService(
            userRepository,
            companyRepository,
            passwordEncoder,
            new UserMapper(),
            auditService
        );
    }

    @Test
    void createThrowsWhenUsernameExists() {
        when(userRepository.existsByUsernameIgnoreCase("firmaadmin")).thenReturn(true);

        assertThatThrownBy(() -> userService.createCompanyUser(new CreateUserRequest(
            "company-1", "firmaadmin", "Password1", "Firma Admin", "admin@acme.com", Set.of(Role.COMPANY_ADMIN)
        ))).isInstanceOf(DuplicateResourceException.class);
    }

    @Test
    void createSavesUserAndWritesAudit() {
        when(companyRepository.existsById("company-1")).thenReturn(true);
        when(userRepository.existsByUsernameIgnoreCase("firmaadmin")).thenReturn(false);
        when(userRepository.existsByEmailIgnoreCase("admin@acme.com")).thenReturn(false);
        when(passwordEncoder.encode("Password1")).thenReturn("encoded");
        when(userRepository.save(org.mockito.ArgumentMatchers.any(User.class)))
            .thenAnswer(invocation -> {
                User user = invocation.getArgument(0);
                user.setId("user-1");
                user.setCreatedAt(Instant.now());
                user.setUpdatedAt(Instant.now());
                return user;
            });

        var response = userService.createCompanyUser(new CreateUserRequest(
            "company-1", "firmaadmin", "Password1", "Firma Admin", "admin@acme.com", Set.of(Role.COMPANY_ADMIN)
        ));

        assertThat(response.username()).isEqualTo("firmaadmin");
        assertThat(response.companyId()).isEqualTo("company-1");
        verify(auditService).recordUserCreated(org.mockito.ArgumentMatchers.any(User.class));
    }

    @Test
    void updateWithoutPasswordKeepsExistingPassword() {
        User user = new User();
        user.setId("user-1");
        user.setUsername("firmaadmin");
        user.setPasswordHash("existing-hash");
        user.setFullName("Firma Admin");
        user.setEmail("admin@acme.com");
        user.setActive(true);
        user.setUserType(UserType.COMPANY_USER);
        user.setCompanyId("company-1");
        user.setRoles(Set.of(Role.COMPANY_ADMIN));
        user.setCreatedAt(Instant.now());
        user.setUpdatedAt(Instant.now());

        when(userRepository.findByIdAndUserType("user-1", UserType.COMPANY_USER)).thenReturn(Optional.of(user));
        when(companyRepository.existsById("company-1")).thenReturn(true);
        when(userRepository.existsByUsernameIgnoreCaseAndIdNot("firmaadmin", "user-1")).thenReturn(false);
        when(userRepository.existsByEmailIgnoreCaseAndIdNot("admin@acme.com", "user-1")).thenReturn(false);
        when(userRepository.save(user)).thenReturn(user);

        userService.updateCompanyUser("user-1", new UpdateUserRequest(
            "company-1", "firmaadmin", null, "Yeni Ad", "admin@acme.com", Set.of(Role.VIEWER), true
        ));

        assertThat(user.getPasswordHash()).isEqualTo("existing-hash");
        assertThat(user.getRoles()).containsExactly(Role.VIEWER);
        verify(auditService).recordUserUpdated(user);
    }
}
