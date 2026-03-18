package com.markethub.backend.repository;

import com.markethub.backend.domain.Company;
import java.util.Optional;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface CompanyRepository extends MongoRepository<Company, String> {

    boolean existsByNameIgnoreCase(String name);

    Optional<Company> findByNameIgnoreCase(String name);
}
