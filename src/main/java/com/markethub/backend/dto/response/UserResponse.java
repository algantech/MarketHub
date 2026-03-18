package com.markethub.backend.dto.response;

import com.markethub.backend.domain.Role;
import com.markethub.backend.domain.User;
import com.markethub.backend.domain.UserType;
import java.time.Instant;
import java.util.Set;

public record UserResponse(
    String id,
    String username,
    String fullName,
    String email,
    boolean active,
    UserType userType,
    String companyId,
    Set<Role> roles,
    Instant createdAt,
    Instant updatedAt
) {

    public static UserResponse from(User user) {
        return new UserResponse(
            user.getId(),
            user.getUsername(),
            user.getFullName(),
            user.getEmail(),
            user.isActive(),
            user.getUserType(),
            user.getCompanyId(),
            user.getRoles(),
            user.getCreatedAt(),
            user.getUpdatedAt()
        );
    }
}
