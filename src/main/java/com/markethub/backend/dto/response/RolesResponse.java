package com.markethub.backend.dto.response;

import com.markethub.backend.domain.Role;
import com.markethub.backend.domain.UserType;
import java.util.Set;

public record RolesResponse(
    UserType currentUserType,
    Set<Role> companyRoles,
    Set<UserType> userTypes
) {
}
