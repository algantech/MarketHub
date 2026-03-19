package com.markethub.backend.audit;

public enum AuditAction {
    LOGIN_SUCCESS,
    LOGIN_FAILURE,
    TOKEN_REFRESH,
    LOGOUT,
    COMPANY_CREATE,
    COMPANY_UPDATE,
    COMPANY_DELETE,
    USER_CREATE,
    USER_UPDATE,
    USER_DELETE
}
