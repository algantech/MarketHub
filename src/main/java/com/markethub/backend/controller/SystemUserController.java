package com.markethub.backend.controller;

import com.markethub.backend.dto.common.ApiResponse;
import com.markethub.backend.dto.request.CreateUserRequest;
import com.markethub.backend.dto.response.UserResponse;
import com.markethub.backend.service.UserService;
import jakarta.validation.Valid;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @GetMapping
    public ApiResponse<List<UserResponse>> list(@RequestParam(required = false) String companyId) {
        return ApiResponse.success(userService.listCompanyUsers(companyId));
    }
}
