package com.markethub.backend.util;

import org.springframework.util.StringUtils;

public final class NormalizationUtils {

    private NormalizationUtils() {
    }

    public static String normalizeUsername(String username) {
        return normalizeLowerCase(username);
    }

    public static String normalizeEmail(String email) {
        return normalizeLowerCase(email);
    }

    public static String normalizeName(String value) {
        return value == null ? null : value.trim();
    }

    public static String normalizeLowerCase(String value) {
        return value == null ? null : value.trim().toLowerCase();
    }

    public static String trimToNull(String value) {
        if (!StringUtils.hasText(value)) {
            return null;
        }
        return value.trim();
    }
}
