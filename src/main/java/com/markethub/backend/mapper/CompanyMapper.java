package com.markethub.backend.mapper;

import com.markethub.backend.domain.Company;
import com.markethub.backend.dto.response.CompanyResponse;
import org.springframework.stereotype.Component;

@Component
public class CompanyMapper {

    public CompanyResponse toResponse(Company company) {
        return new CompanyResponse(
            company.getId(),
            company.getName(),
            company.isActive(),
            company.getCreatedAt(),
            company.getUpdatedAt()
        );
    }
}
