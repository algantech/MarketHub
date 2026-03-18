package com.markethub.backend.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "app.bootstrap")
public class BootstrapProperties {

    private boolean enabled = true;
    private final SystemAdmin systemAdmin = new SystemAdmin();

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public SystemAdmin getSystemAdmin() {
        return systemAdmin;
    }

    public static class SystemAdmin {

        private String username = "sysadmin";
        private String password = "Admin123!";
        private String fullName = "System Admin";
        private String email = "sysadmin@localhost";

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getFullName() {
            return fullName;
        }

        public void setFullName(String fullName) {
            this.fullName = fullName;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }
    }
}
