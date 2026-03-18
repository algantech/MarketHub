package com.markethub.backend.service;

import com.markethub.backend.domain.User;
import com.markethub.backend.domain.UserType;
import com.markethub.backend.dto.request.CreateUserRequest;
import com.markethub.backend.dto.request.UpdateUserRequest;
import com.markethub.backend.dto.response.UserResponse;
import com.markethub.backend.exception.BusinessException;
import com.markethub.backend.exception.DuplicateResourceException;
import com.markethub.backend.exception.ResourceNotFoundException;
import com.markethub.backend.repository.CompanyRepository;
import com.markethub.backend.repository.UserRepository;
import java.time.Instant;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final CompanyRepository companyRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(
        UserRepository userRepository,
        CompanyRepository companyRepository,
        PasswordEncoder passwordEncoder
    ) {
        this.userRepository = userRepository;
        this.companyRepository = companyRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public UserResponse createCompanyUser(CreateUserRequest request) {
        String normalizedUsername = normalizeUsername(request.username());
        String normalizedEmail = normalizeEmail(request.email());

        validateCompanyUserUniqueness(normalizedUsername, normalizedEmail, null);
        Instant now = Instant.now();
        User user = new User();
        applyCompanyUserFields(
            user,
            request.companyId(),
            normalizedUsername,
            request.password(),
            request.fullName(),
            normalizedEmail,
            request.roles(),
            true,
            true
        );
        user.setCreatedAt(now);
        user.setUpdatedAt(now);

        return UserResponse.from(userRepository.save(user));
    }

    public List<UserResponse> listCompanyUsers(String companyId) {
        List<User> users;

        if (StringUtils.hasText(companyId)) {
            if (!companyRepository.existsById(companyId)) {
                throw new ResourceNotFoundException("Firma bulunamadi");
            }
            users = userRepository.findAllByUserTypeAndCompanyId(UserType.COMPANY_USER, companyId);
        } else {
            users = userRepository.findAllByUserType(UserType.COMPANY_USER);
        }

        return users.stream()
            .sorted(Comparator.comparing(User::getFullName, String.CASE_INSENSITIVE_ORDER))
            .map(UserResponse::from)
            .toList();
    }

    public UserResponse updateCompanyUser(String userId, UpdateUserRequest request) {
        String normalizedUsername = normalizeUsername(request.username());
        String normalizedEmail = normalizeEmail(request.email());
        User user = userRepository.findByIdAndUserType(userId, UserType.COMPANY_USER)
            .orElseThrow(() -> new ResourceNotFoundException("Kullanici bulunamadi"));

        validateCompanyUserUniqueness(normalizedUsername, normalizedEmail, userId);
        applyCompanyUserFields(
            user,
            request.companyId(),
            normalizedUsername,
            request.password(),
            request.fullName(),
            normalizedEmail,
            request.roles(),
            request.active(),
            false
        );
        user.setUpdatedAt(Instant.now());

        return UserResponse.from(userRepository.save(user));
    }

    public void deleteCompanyUser(String userId) {
        User user = userRepository.findByIdAndUserType(userId, UserType.COMPANY_USER)
            .orElseThrow(() -> new ResourceNotFoundException("Kullanici bulunamadi"));
        userRepository.delete(user);
    }

    private void validateCompanyUserUniqueness(String username, String email, String userId) {
        if (userId == null) {
            if (userRepository.existsByUsernameIgnoreCase(username)) {
                throw new DuplicateResourceException("Bu kullanici adi zaten kullaniliyor");
            }
            if (userRepository.existsByEmailIgnoreCase(email)) {
                throw new DuplicateResourceException("Bu e-posta zaten kullaniliyor");
            }
            return;
        }

        if (userRepository.existsByUsernameIgnoreCaseAndIdNot(username, userId)) {
            throw new DuplicateResourceException("Bu kullanici adi zaten kullaniliyor");
        }
        if (userRepository.existsByEmailIgnoreCaseAndIdNot(email, userId)) {
            throw new DuplicateResourceException("Bu e-posta zaten kullaniliyor");
        }
    }

    private void applyCompanyUserFields(
        User user,
        String companyId,
        String username,
        String password,
        String fullName,
        String email,
        Set<com.markethub.backend.domain.Role> roles,
        boolean active,
        boolean passwordRequired
    ) {
        if (!companyRepository.existsById(companyId)) {
            throw new ResourceNotFoundException("Firma bulunamadi");
        }
        if (passwordRequired && !StringUtils.hasText(password)) {
            throw new BusinessException("Sifre zorunludur");
        }

        user.setUsername(username);
        user.setFullName(fullName.trim());
        user.setEmail(email);
        user.setActive(active);
        user.setUserType(UserType.COMPANY_USER);
        user.setCompanyId(companyId);
        user.setRoles(new HashSet<>(roles));

        if (StringUtils.hasText(password)) {
            user.setPasswordHash(passwordEncoder.encode(password));
        }
    }

    private String normalizeUsername(String username) {
        return username.trim().toLowerCase();
    }

    private String normalizeEmail(String email) {
        return email.trim().toLowerCase();
    }
}
