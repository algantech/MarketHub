package com.markethub.backend.controller;

import com.markethub.backend.dto.common.ApiResponse;
import com.markethub.backend.dto.request.CreateUserRequest;
import com.markethub.backend.dto.response.UserResponse;
import com.markethub.backend.service.UserService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/system/users")
public class SystemUserController {

    private final UserService userService;

    public SystemUserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping
    public ApiResponse<UserResponse> create(@Valid @RequestBody CreateUserRequest request) {
        return ApiResponse.success("Kullanici olusturuldu", userService.createCompanyUser(request));
    }
}
