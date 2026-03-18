package com.markethub.backend.service;

import com.markethub.backend.domain.Company;
import com.markethub.backend.dto.request.CreateCompanyRequest;
import com.markethub.backend.dto.request.UpdateCompanyRequest;
import com.markethub.backend.dto.response.CompanyResponse;
import com.markethub.backend.exception.BusinessException;
import com.markethub.backend.exception.DuplicateResourceException;
import com.markethub.backend.exception.ResourceNotFoundException;
import com.markethub.backend.repository.CompanyRepository;
import com.markethub.backend.repository.UserRepository;
import com.markethub.backend.domain.UserType;
import java.time.Instant;
import java.util.Comparator;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {

    private final CompanyRepository companyRepository;
    private final UserRepository userRepository;

    public CompanyService(CompanyRepository companyRepository, UserRepository userRepository) {
        this.companyRepository = companyRepository;
        this.userRepository = userRepository;
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
            .sorted(Comparator.comparing(Company::getName, String.CASE_INSENSITIVE_ORDER))
            .map(CompanyResponse::from)
            .toList();
    }

    public CompanyResponse update(String companyId, UpdateCompanyRequest request) {
        Company company = companyRepository.findById(companyId)
            .orElseThrow(() -> new ResourceNotFoundException("Firma bulunamadi"));

        String normalizedName = request.name().trim();
        companyRepository.findByNameIgnoreCase(normalizedName)
            .filter(existing -> !existing.getId().equals(companyId))
            .ifPresent(existing -> {
                throw new DuplicateResourceException("Bu isimde bir firma zaten mevcut");
            });

        company.setName(normalizedName);
        company.setActive(request.active());
        company.setUpdatedAt(Instant.now());

        return CompanyResponse.from(companyRepository.save(company));
    }

    public void delete(String companyId) {
        Company company = companyRepository.findById(companyId)
            .orElseThrow(() -> new ResourceNotFoundException("Firma bulunamadi"));

        long companyUserCount = userRepository.countByCompanyIdAndUserType(companyId, UserType.COMPANY_USER);
        if (companyUserCount > 0) {
            throw new BusinessException("Firmaya bagli kullanicilar oldugu icin silinemez");
        }

        companyRepository.delete(company);
    }
}
