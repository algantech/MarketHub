package com.markethub.backend.dto.response;

import com.markethub.backend.domain.Company;
import java.time.Instant;

public record CompanyResponse(
    String id,
    String name,
    boolean active,
    Instant createdAt,
    Instant updatedAt
) {

    public static CompanyResponse from(Company company) {
        return new CompanyResponse(
            company.getId(),
            company.getName(),
            company.isActive(),
            company.getCreatedAt(),
            company.getUpdatedAt()
        );
    }
}
