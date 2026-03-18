package com.markethub.backend.dto.response;

import com.markethub.backend.domain.Role;
import com.markethub.backend.domain.UserType;
import java.util.Set;

public record CurrentUserResponse(
    String id,
    String username,
    String fullName,
    String email,
    UserType userType,
    String companyId,
    Set<Role> roles
) {
}
