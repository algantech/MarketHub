package com.markethub.backend;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.markethub.backend.audit.AuditAction;
import com.markethub.backend.audit.AuditLogRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.testcontainers.containers.MongoDBContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;

@SpringBootTest
@AutoConfigureMockMvc
@Testcontainers(disabledWithoutDocker = true)
class SystemAdminFlowIntegrationTest {

    @Container
    static MongoDBContainer mongoDBContainer = new MongoDBContainer("mongo:7.0");

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private AuditLogRepository auditLogRepository;

    @DynamicPropertySource
    static void registerProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.data.mongodb.uri", mongoDBContainer::getReplicaSetUrl);
        registry.add("app.bootstrap.system-admin.username", () -> "tahir");
        registry.add("app.bootstrap.system-admin.password", () -> "HGS71mw9");
        registry.add("app.bootstrap.system-admin.full-name", () -> "Tahir Admin");
        registry.add("app.bootstrap.system-admin.email", () -> "tahir@example.com");
    }

    @Test
    void systemAdminCanLoginCreateCompanyAndCreateUser() throws Exception {
        MvcResult loginResult = mockMvc.perform(post("/api/auth/login")
                .contentType("application/json")
                .content("""
                    {
                      "username": "tahir",
                      "password": "HGS71mw9"
                    }
                    """))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.data.user.userType").value("SYSTEM_ADMIN"))
            .andReturn();

        JsonNode loginJson = readJson(loginResult).path("data");
        String token = loginJson.path("accessToken").asText();
        String refreshToken = loginJson.path("refreshToken").asText();

        mockMvc.perform(get("/api/auth/roles")
                .header("Authorization", "Bearer " + token))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.data.currentUserType").value("SYSTEM_ADMIN"))
            .andExpect(jsonPath("$.data.companyRoles[0]").exists());

        MvcResult refreshResult = mockMvc.perform(post("/api/auth/refresh")
                .contentType("application/json")
                .content("""
                    {
                      "refreshToken": "%s"
                    }
                    """.formatted(refreshToken)))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.data.accessToken").isNotEmpty())
            .andExpect(jsonPath("$.data.refreshToken").isNotEmpty())
            .andReturn();

        String rotatedRefreshToken = readJson(refreshResult).path("data").path("refreshToken").asText();

        MvcResult companyResult = mockMvc.perform(post("/api/system/companies")
                .header("Authorization", "Bearer " + token)
                .contentType("application/json")
                .content("""
                    {
                      "name": "Acme"
                    }
                    """))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.data.name").value("Acme"))
            .andReturn();

        String companyId = readJson(companyResult).path("data").path("id").asText();

        mockMvc.perform(post("/api/system/users")
                .header("Authorization", "Bearer " + token)
                .contentType("application/json")
                .content("""
                    {
                      "companyId": "%s",
                      "username": "firmaadmin",
                      "password": "Password1",
                      "fullName": "Firma Admin",
                      "email": "admin@acme.com",
                      "roles": ["COMPANY_ADMIN"]
                    }
                    """.formatted(companyId)))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.data.username").value("firmaadmin"));

        mockMvc.perform(get("/api/system/users")
                .queryParam("companyId", companyId)
                .header("Authorization", "Bearer " + token))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.data[0].username").value("firmaadmin"));

        mockMvc.perform(post("/api/auth/logout")
                .contentType("application/json")
                .content("""
                    {
                      "refreshToken": "%s"
                    }
                    """.formatted(rotatedRefreshToken)))
            .andExpect(status().isOk());

        assertThat(auditLogRepository.findAll())
            .extracting(log -> log.getAction())
            .contains(
                AuditAction.LOGIN_SUCCESS,
                AuditAction.TOKEN_REFRESH,
                AuditAction.LOGOUT,
                AuditAction.COMPANY_CREATE,
                AuditAction.USER_CREATE
            );
    }

    private JsonNode readJson(MvcResult result) throws Exception {
        return objectMapper.readTree(result.getResponse().getContentAsString());
    }
}
