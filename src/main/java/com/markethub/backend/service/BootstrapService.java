package com.markethub.backend.service;

import com.markethub.backend.config.BootstrapProperties;
import com.markethub.backend.domain.User;
import com.markethub.backend.domain.UserType;
import com.markethub.backend.repository.UserRepository;
import java.time.Instant;
import java.util.Set;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
public class BootstrapService implements CommandLineRunner {

    private final BootstrapProperties bootstrapProperties;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public BootstrapService(
        BootstrapProperties bootstrapProperties,
        UserRepository userRepository,
        PasswordEncoder passwordEncoder
    ) {
        this.bootstrapProperties = bootstrapProperties;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        if (!bootstrapProperties.isEnabled()) {
            return;
        }

        Instant now = Instant.now();
        String username = normalizeUsername(bootstrapProperties.getSystemAdmin().getUsername());
        User user = userRepository.findFirstByUserType(UserType.SYSTEM_ADMIN)
            .orElseGet(User::new);

        if (user.getId() == null && userRepository.existsByUsernameIgnoreCase(username)) {
            return;
        }

        user.setUsername(username);
        user.setPasswordHash(passwordEncoder.encode(bootstrapProperties.getSystemAdmin().getPassword()));
        user.setFullName(bootstrapProperties.getSystemAdmin().getFullName());
        user.setEmail(bootstrapProperties.getSystemAdmin().getEmail());
        user.setActive(true);
        user.setUserType(UserType.SYSTEM_ADMIN);
        user.setCompanyId(null);
        user.setRoles(Set.of());
        if (user.getCreatedAt() == null) {
            user.setCreatedAt(now);
        }
        user.setUpdatedAt(now);

        userRepository.save(user);
    }

    private String normalizeUsername(String username) {
        if (!StringUtils.hasText(username)) {
            return username;
        }
        return username.trim().toLowerCase();
    }
}
