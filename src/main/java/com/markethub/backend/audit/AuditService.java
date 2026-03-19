package com.markethub.backend.audit;

import com.markethub.backend.domain.Company;
import com.markethub.backend.domain.User;
import com.markethub.backend.security.AuthenticatedUser;
import com.markethub.backend.util.SecurityUtils;
import java.time.Instant;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class AuditService {

    private static final Logger log = LoggerFactory.getLogger(AuditService.class);

    private final AuditLogRepository auditLogRepository;

    public AuditService(AuditLogRepository auditLogRepository) {
        this.auditLogRepository = auditLogRepository;
    }

    public void recordLoginSuccess(User user) {
        save(buildLog(
            AuditAction.LOGIN_SUCCESS,
            AuditStatus.SUCCESS,
            user.getId(),
            user.getUsername(),
            user.getUserType(),
            "USER",
            user.getId(),
            user.getUsername(),
            "Kullanici girisi basarili",
            Map.of("targetUserType", user.getUserType().name())
        ));
    }

    public void recordLoginFailure(String username) {
        save(buildLog(
            AuditAction.LOGIN_FAILURE,
            AuditStatus.FAILURE,
            null,
            username,
            null,
            "USER",
            null,
            username,
            "Kullanici girisi basarisiz",
            Map.of()
        ));
    }

    public void recordCompanyCreated(Company company) {
        saveForCurrentActor(AuditAction.COMPANY_CREATE, AuditStatus.SUCCESS, "COMPANY",
            company.getId(), company.getName(), "Firma olusturuldu", Map.of("active", company.isActive()));
    }

    public void recordCompanyUpdated(Company company) {
        saveForCurrentActor(AuditAction.COMPANY_UPDATE, AuditStatus.SUCCESS, "COMPANY",
            company.getId(), company.getName(), "Firma guncellendi", Map.of("active", company.isActive()));
    }

    public void recordCompanyDeleted(Company company) {
        saveForCurrentActor(AuditAction.COMPANY_DELETE, AuditStatus.SUCCESS, "COMPANY",
            company.getId(), company.getName(), "Firma silindi", Map.of());
    }

    public void recordUserCreated(User user) {
        saveForCurrentActor(AuditAction.USER_CREATE, AuditStatus.SUCCESS, "USER",
            user.getId(), user.getUsername(), "Firma kullanicisi olusturuldu",
            Map.of("companyId", user.getCompanyId(), "active", user.isActive(), "userType", user.getUserType().name()));
    }

    public void recordUserUpdated(User user) {
        saveForCurrentActor(AuditAction.USER_UPDATE, AuditStatus.SUCCESS, "USER",
            user.getId(), user.getUsername(), "Firma kullanicisi guncellendi",
            Map.of("companyId", user.getCompanyId(), "active", user.isActive(), "userType", user.getUserType().name()));
    }

    public void recordUserDeleted(User user) {
        saveForCurrentActor(AuditAction.USER_DELETE, AuditStatus.SUCCESS, "USER",
            user.getId(), user.getUsername(), "Firma kullanicisi silindi",
            Map.of("companyId", user.getCompanyId(), "userType", user.getUserType().name()));
    }

    public void recordTokenRefresh(User user, String sessionId) {
        save(buildLog(
            AuditAction.TOKEN_REFRESH,
            AuditStatus.SUCCESS,
            user.getId(),
            user.getUsername(),
            user.getUserType(),
            "SESSION",
            sessionId,
            user.getUsername(),
            "Oturum yenilendi",
            Map.of("companyId", user.getCompanyId() == null ? "" : user.getCompanyId())
        ));
    }

    public void recordLogout(String actorUserId, String actorUsername,
                             com.markethub.backend.domain.UserType userType, String sessionId) {
        save(buildLog(
            AuditAction.LOGOUT,
            AuditStatus.SUCCESS,
            actorUserId,
            actorUsername,
            userType,
            "SESSION",
            sessionId,
            actorUsername,
            "Oturum kapatildi",
            Map.of()
        ));
    }

    private void saveForCurrentActor(
        AuditAction action,
        AuditStatus status,
        String entityType,
        String entityId,
        String entityName,
        String message,
        Map<String, Object> metadata
    ) {
        AuthenticatedUser actor = SecurityUtils.getCurrentUser().orElse(null);
        save(buildLog(
            action,
            status,
            actor == null ? null : actor.getId(),
            actor == null ? null : actor.getUsername(),
            actor == null ? null : actor.getUserType(),
            entityType,
            entityId,
            entityName,
            message,
            metadata
        ));
    }

    private AuditLog buildLog(
        AuditAction action,
        AuditStatus status,
        String actorUserId,
        String actorUsername,
        com.markethub.backend.domain.UserType actorUserType,
        String entityType,
        String entityId,
        String entityName,
        String message,
        Map<String, Object> metadata
    ) {
        AuditLog auditLog = new AuditLog();
        auditLog.setAction(action);
        auditLog.setStatus(status);
        auditLog.setActorUserId(actorUserId);
        auditLog.setActorUsername(actorUsername);
        auditLog.setActorUserType(actorUserType);
        auditLog.setEntityType(entityType);
        auditLog.setEntityId(entityId);
        auditLog.setEntityName(entityName);
        auditLog.setMessage(message);
        auditLog.setMetadata(metadata);
        auditLog.setCreatedAt(Instant.now());
        return auditLog;
    }

    private void save(AuditLog auditLog) {
        try {
            auditLogRepository.save(auditLog);
            log.info("Audit event recorded: action={}, status={}, entityType={}, entityId={}",
                auditLog.getAction(), auditLog.getStatus(), auditLog.getEntityType(), auditLog.getEntityId());
        } catch (Exception exception) {
            log.error("Audit event could not be persisted: action={}, entityType={}, entityId={}",
                auditLog.getAction(), auditLog.getEntityType(), auditLog.getEntityId(), exception);
        }
    }
}
