package com.markethub.backend.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "app.jwt")
public class JwtProperties {

    private String secret = "change-me-change-me-change-me-123456";
    private long accessExpirationSeconds = 900;
    private long refreshExpirationSeconds = 604800;
    private String issuer = "markethub";

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public long getAccessExpirationSeconds() {
        return accessExpirationSeconds;
    }

    public void setAccessExpirationSeconds(long accessExpirationSeconds) {
        this.accessExpirationSeconds = accessExpirationSeconds;
    }

    public long getRefreshExpirationSeconds() {
        return refreshExpirationSeconds;
    }

    public void setRefreshExpirationSeconds(long refreshExpirationSeconds) {
        this.refreshExpirationSeconds = refreshExpirationSeconds;
    }

    public String getIssuer() {
        return issuer;
    }

    public void setIssuer(String issuer) {
        this.issuer = issuer;
    }
}
