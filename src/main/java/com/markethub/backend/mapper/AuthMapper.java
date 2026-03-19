package com.markethub.backend.mapper;

import com.markethub.backend.dto.response.LoginResponse;
import com.markethub.backend.security.AuthenticatedUser;
import org.springframework.stereotype.Component;

@Component
public class AuthMapper {

    private final UserMapper userMapper;

    public AuthMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public LoginResponse toLoginResponse(
        String accessToken,
        String refreshToken,
        long accessExpirationSeconds,
        long refreshExpirationSeconds,
        AuthenticatedUser user
    ) {
        return new LoginResponse(
            accessToken,
            refreshToken,
            "Bearer",
            accessExpirationSeconds,
            refreshExpirationSeconds,
            userMapper.toCurrentUserResponse(user)
        );
    }
}
