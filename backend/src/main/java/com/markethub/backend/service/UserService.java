package com.markethub.backend.service;

import com.markethub.backend.domain.User;
import com.markethub.backend.domain.UserType;
import com.markethub.backend.dto.request.CreateUserRequest;
import com.markethub.backend.dto.response.UserResponse;
import com.markethub.backend.exception.DuplicateResourceException;
import com.markethub.backend.exception.ResourceNotFoundException;
import com.markethub.backend.repository.CompanyRepository;
import com.markethub.backend.repository.UserRepository;
import java.time.Instant;
import java.util.HashSet;
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
        String normalizedUsername = request.username().trim().toLowerCase();
        String normalizedEmail = request.email().trim().toLowerCase();

        if (!companyRepository.existsById(request.companyId())) {
            throw new ResourceNotFoundException("Firma bulunamadi");
        }
        if (userRepository.existsByUsernameIgnoreCase(normalizedUsername)) {
            throw new DuplicateResourceException("Bu kullanici adi zaten kullaniliyor");
        }
        if (StringUtils.hasText(normalizedEmail) && userRepository.existsByEmailIgnoreCase(normalizedEmail)) {
            throw new DuplicateResourceException("Bu e-posta zaten kullaniliyor");
        }

        Instant now = Instant.now();
        User user = new User();
        user.setUsername(normalizedUsername);
        user.setPasswordHash(passwordEncoder.encode(request.password()));
        user.setFullName(request.fullName().trim());
        user.setEmail(normalizedEmail);
        user.setActive(true);
        user.setUserType(UserType.COMPANY_USER);
        user.setCompanyId(request.companyId());
        user.setRoles(new HashSet<>(request.roles()));
        user.setCreatedAt(now);
        user.setUpdatedAt(now);

        return UserResponse.from(userRepository.save(user));
    }
}
