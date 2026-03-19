package com.markethub.backend.controller;

import com.markethub.backend.dto.common.ApiResponse;
import com.markethub.backend.dto.request.LoginRequest;
import com.markethub.backend.dto.request.LogoutRequest;
import com.markethub.backend.dto.request.RefreshTokenRequest;
import com.markethub.backend.dto.response.CurrentUserResponse;
import com.markethub.backend.dto.response.LoginResponse;
import com.markethub.backend.dto.response.RolesResponse;
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

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    public ApiResponse<LoginResponse> login(@Valid @RequestBody LoginRequest request) {
        return ApiResponse.success(authService.login(request));
    }

    @PostMapping("/refresh")
    public ApiResponse<LoginResponse> refresh(@Valid @RequestBody RefreshTokenRequest request) {
        return ApiResponse.success(authService.refresh(request));
    }

    @PostMapping("/logout")
    public ApiResponse<Void> logout(
        @RequestBody(required = false) LogoutRequest request,
        @AuthenticationPrincipal AuthenticatedUser user
    ) {
        authService.logout(request, user);
        return ApiResponse.success("Oturum kapatildi", null);
    }

    @GetMapping("/me")
    public ApiResponse<CurrentUserResponse> me(@AuthenticationPrincipal AuthenticatedUser user) {
        return ApiResponse.success(authService.me(user));
    }

    @GetMapping("/roles")
    public ApiResponse<RolesResponse> roles(@AuthenticationPrincipal AuthenticatedUser user) {
        return ApiResponse.success(authService.getRoles(user));
    }
}
