package com.markethub.backend.dto.response;

public record LoginResponse(
    String accessToken,
    String refreshToken,
    String tokenType,
    long expiresIn,
    long refreshExpiresIn,
    CurrentUserResponse user
) {
}
