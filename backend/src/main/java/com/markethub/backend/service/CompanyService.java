package com.markethub.backend.service;

import com.markethub.backend.domain.Company;
import com.markethub.backend.dto.request.CreateCompanyRequest;
import com.markethub.backend.dto.response.CompanyResponse;
import com.markethub.backend.exception.DuplicateResourceException;
import com.markethub.backend.repository.CompanyRepository;
import java.time.Instant;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {

    private final CompanyRepository companyRepository;

    public CompanyService(CompanyRepository companyRepository) {
        this.companyRepository = companyRepository;
    }

    public CompanyResponse create(CreateCompanyRequest request) {
        String normalizedName = request.name().trim();

        if (companyRepository.existsByNameIgnoreCase(normalizedName)) {
            throw new DuplicateResourceException("Bu isimde bir firma zaten mevcut");
        }

        Instant now = Instant.now();
        Company company = new Company();
        company.setName(normalizedName);
        company.setActive(true);
        company.setCreatedAt(now);
        company.setUpdatedAt(now);

        return CompanyResponse.from(companyRepository.save(company));
    }

    public List<CompanyResponse> list() {
        return companyRepository.findAll()
            .stream()
            .map(CompanyResponse::from)
            .toList();
    }
}
