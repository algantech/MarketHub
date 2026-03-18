package com.markethub.backend.controller;

import com.markethub.backend.config.JwtProperties;
import com.markethub.backend.dto.common.ApiResponse;
import com.markethub.backend.dto.request.LoginRequest;
import com.markethub.backend.dto.response.CurrentUserResponse;
import com.markethub.backend.dto.response.LoginResponse;
import com.markethub.backend.security.AuthenticatedUser;
import com.markethub.backend.service.AuthService;
import jakarta.validation.Valid;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;
    private final JwtProperties jwtProperties;

    public AuthController(AuthService authService, JwtProperties jwtProperties) {
        this.authService = authService;
        this.jwtProperties = jwtProperties;
    }

    @PostMapping("/login")
    public ApiResponse<LoginResponse> login(@Valid @RequestBody LoginRequest request) {
        return ApiResponse.success(
            authService.login(request, jwtProperties.getExpirationSeconds())
        );
    }

    @GetMapping("/me")
    public ApiResponse<CurrentUserResponse> me(@AuthenticationPrincipal AuthenticatedUser user) {
        return ApiResponse.success(authService.me(user));
    }
}
