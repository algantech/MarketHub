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

    public LoginResponse toLoginResponse(String token, long expirationSeconds, AuthenticatedUser user) {
        return new LoginResponse(
            token,
            "Bearer",
            expirationSeconds,
            userMapper.toCurrentUserResponse(user)
        );
    }
}
