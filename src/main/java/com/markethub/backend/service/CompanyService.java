package com.markethub.backend.service;

import com.markethub.backend.audit.AuditService;
import com.markethub.backend.domain.Company;
import com.markethub.backend.domain.UserType;
import com.markethub.backend.dto.request.CreateCompanyRequest;
import com.markethub.backend.dto.request.UpdateCompanyRequest;
import com.markethub.backend.dto.response.CompanyResponse;
import com.markethub.backend.exception.BusinessException;
import com.markethub.backend.exception.DuplicateResourceException;
import com.markethub.backend.exception.ResourceNotFoundException;
import com.markethub.backend.mapper.CompanyMapper;
import com.markethub.backend.repository.CompanyRepository;
import com.markethub.backend.repository.UserRepository;
import com.markethub.backend.util.NormalizationUtils;
import java.time.Instant;
import java.util.Comparator;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {

    private static final Logger log = LoggerFactory.getLogger(CompanyService.class);

    private final CompanyRepository companyRepository;
    private final UserRepository userRepository;
    private final CompanyMapper companyMapper;
    private final AuditService auditService;

    public CompanyService(
        CompanyRepository companyRepository,
        UserRepository userRepository,
        CompanyMapper companyMapper,
        AuditService auditService
    ) {
        this.companyRepository = companyRepository;
        this.userRepository = userRepository;
        this.companyMapper = companyMapper;
        this.auditService = auditService;
    }

    public CompanyResponse create(CreateCompanyRequest request) {
        String normalizedName = NormalizationUtils.normalizeName(request.name());

        if (companyRepository.existsByNameIgnoreCase(normalizedName)) {
            throw new DuplicateResourceException("Bu isimde bir firma zaten mevcut");
        }

        Instant now = Instant.now();
        Company company = new Company();
        company.setName(normalizedName);
        company.setActive(true);
        company.setCreatedAt(now);
        company.setUpdatedAt(now);

        Company savedCompany = companyRepository.save(company);
        auditService.recordCompanyCreated(savedCompany);
        log.info("Company created: id={}, name={}", savedCompany.getId(), savedCompany.getName());
        return companyMapper.toResponse(savedCompany);
    }

    public List<CompanyResponse> list() {
        return companyRepository.findAll()
            .stream()
            .sorted(Comparator.comparing(Company::getName, String.CASE_INSENSITIVE_ORDER))
            .map(companyMapper::toResponse)
            .toList();
    }

    public CompanyResponse update(String companyId, UpdateCompanyRequest request) {
        Company company = companyRepository.findById(companyId)
            .orElseThrow(() -> new ResourceNotFoundException("Firma bulunamadi"));

        String normalizedName = NormalizationUtils.normalizeName(request.name());
        companyRepository.findByNameIgnoreCase(normalizedName)
            .filter(existing -> !existing.getId().equals(companyId))
            .ifPresent(existing -> {
                throw new DuplicateResourceException("Bu isimde bir firma zaten mevcut");
            });

        company.setName(normalizedName);
        company.setActive(request.active());
        company.setUpdatedAt(Instant.now());

        Company updatedCompany = companyRepository.save(company);
        auditService.recordCompanyUpdated(updatedCompany);
        log.info("Company updated: id={}, name={}, active={}",
            updatedCompany.getId(), updatedCompany.getName(), updatedCompany.isActive());
        return companyMapper.toResponse(updatedCompany);
    }

    public void delete(String companyId) {
        Company company = companyRepository.findById(companyId)
            .orElseThrow(() -> new ResourceNotFoundException("Firma bulunamadi"));

        long companyUserCount = userRepository.countByCompanyIdAndUserType(companyId, UserType.COMPANY_USER);
        if (companyUserCount > 0) {
            throw new BusinessException("Firmaya bagli kullanicilar oldugu icin silinemez");
        }

        companyRepository.delete(company);
        auditService.recordCompanyDeleted(company);
        log.info("Company deleted: id={}, name={}", company.getId(), company.getName());
    }
}
