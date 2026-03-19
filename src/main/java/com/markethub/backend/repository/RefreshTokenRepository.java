package com.markethub.backend.repository;

import com.markethub.backend.domain.RefreshToken;
import java.time.Instant;
import java.util.List;
import java.util.Optional;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface RefreshTokenRepository extends MongoRepository<RefreshToken, String> {

    Optional<RefreshToken> findByTokenHash(String tokenHash);

    List<RefreshToken> findAllByUserIdAndRevokedFalse(String userId);

    List<RefreshToken> findAllByExpiresAtBeforeAndRevokedFalse(Instant instant);
}
