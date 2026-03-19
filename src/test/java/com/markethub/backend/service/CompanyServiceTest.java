package com.markethub.backend.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.markethub.backend.audit.AuditService;
import com.markethub.backend.domain.Company;
import com.markethub.backend.dto.request.CreateCompanyRequest;
import com.markethub.backend.dto.request.UpdateCompanyRequest;
import com.markethub.backend.exception.BusinessException;
import com.markethub.backend.exception.DuplicateResourceException;
import com.markethub.backend.mapper.CompanyMapper;
import com.markethub.backend.repository.CompanyRepository;
import com.markethub.backend.repository.UserRepository;
import java.time.Instant;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class CompanyServiceTest {

    @Mock
    private CompanyRepository companyRepository;
    @Mock
    private UserRepository userRepository;
    @Mock
    private AuditService auditService;

    private CompanyService companyService;

    @BeforeEach
    void setUp() {
        companyService = new CompanyService(companyRepository, userRepository, new CompanyMapper(), auditService);
    }

    @Test
    void createThrowsWhenNameAlreadyExists() {
        when(companyRepository.existsByNameIgnoreCase("Acme")).thenReturn(true);

        assertThatThrownBy(() -> companyService.create(new CreateCompanyRequest("Acme")))
            .isInstanceOf(DuplicateResourceException.class);
    }

    @Test
    void updateChangesCompanyAndWritesAudit() {
        Company company = buildCompany();
        when(companyRepository.findById("company-1")).thenReturn(Optional.of(company));
        when(companyRepository.findByNameIgnoreCase("New Name")).thenReturn(Optional.empty());
        when(companyRepository.save(company)).thenReturn(company);

        var response = companyService.update("company-1", new UpdateCompanyRequest("New Name", false));

        assertThat(response.name()).isEqualTo("New Name");
        assertThat(company.isActive()).isFalse();
        verify(auditService).recordCompanyUpdated(company);
    }

    @Test
    void deleteThrowsWhenCompanyHasUsers() {
        Company company = buildCompany();
        when(companyRepository.findById("company-1")).thenReturn(Optional.of(company));
        when(userRepository.countByCompanyIdAndUserType("company-1", com.markethub.backend.domain.UserType.COMPANY_USER))
            .thenReturn(2L);

        assertThatThrownBy(() -> companyService.delete("company-1"))
            .isInstanceOf(BusinessException.class)
            .hasMessage("Firmaya bagli kullanicilar oldugu icin silinemez");
    }

    private Company buildCompany() {
        Company company = new Company();
        company.setId("company-1");
        company.setName("Acme");
        company.setActive(true);
        company.setCreatedAt(Instant.now());
        company.setUpdatedAt(Instant.now());
        return company;
    }
}
