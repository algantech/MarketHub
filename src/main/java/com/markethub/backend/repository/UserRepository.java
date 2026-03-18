package com.markethub.backend.repository;

import com.markethub.backend.domain.User;
import com.markethub.backend.domain.UserType;
import java.util.List;
import java.util.Optional;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<User, String> {

    Optional<User> findByUsernameIgnoreCase(String username);

    boolean existsByUsernameIgnoreCase(String username);

    boolean existsByEmailIgnoreCase(String email);

    boolean existsByUsernameIgnoreCaseAndIdNot(String username, String id);

    boolean existsByEmailIgnoreCaseAndIdNot(String email, String id);

    Optional<User> findFirstByUserType(UserType userType);

    long countByCompanyIdAndUserType(String companyId, UserType userType);

    Optional<User> findByIdAndUserType(String id, UserType userType);

    List<User> findAllByUserType(UserType userType);

    List<User> findAllByUserTypeAndCompanyId(UserType userType, String companyId);
}
