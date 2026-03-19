package com.markethub.backend.mapper;

import com.markethub.backend.domain.User;
import com.markethub.backend.dto.response.CurrentUserResponse;
import com.markethub.backend.dto.response.UserResponse;
import com.markethub.backend.security.AuthenticatedUser;
import org.springframework.stereotype.Component;

@Component
public class UserMapper {

    public UserResponse toResponse(User user) {
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

    public CurrentUserResponse toCurrentUserResponse(AuthenticatedUser user) {
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
}
