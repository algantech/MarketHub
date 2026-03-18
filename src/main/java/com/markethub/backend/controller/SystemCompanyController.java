package com.markethub.backend.controller;

import com.markethub.backend.dto.common.ApiResponse;
import com.markethub.backend.dto.request.CreateCompanyRequest;
import com.markethub.backend.dto.response.CompanyResponse;
import com.markethub.backend.service.CompanyService;
import jakarta.validation.Valid;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/system/companies")
public class SystemCompanyController {

    private final CompanyService companyService;

    public SystemCompanyController(CompanyService companyService) {
        this.companyService = companyService;
    }

    @PostMapping
    public ApiResponse<CompanyResponse> create(@Valid @RequestBody CreateCompanyRequest request) {
        return ApiResponse.success("Firma olusturuldu", companyService.create(request));
    }

    @GetMapping
    public ApiResponse<List<CompanyResponse>> list() {
        return ApiResponse.success(companyService.list());
    }
}
