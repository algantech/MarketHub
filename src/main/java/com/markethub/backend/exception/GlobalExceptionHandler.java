package com.markethub.backend.exception;

import com.markethub.backend.dto.common.ApiErrorResponse;
import com.markethub.backend.dto.common.FieldErrorDetail;
import jakarta.servlet.http.HttpServletRequest;
import java.time.Instant;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ApiErrorResponse> handleValidation(
        MethodArgumentNotValidException exception,
        HttpServletRequest request
    ) {
        log.warn("Validation error at path={}", request.getRequestURI());
        List<FieldErrorDetail> details = exception.getBindingResult()
            .getFieldErrors()
            .stream()
            .map(this::toDetail)
            .toList();

        return ResponseEntity.badRequest().body(new ApiErrorResponse(
            Instant.now(),
            HttpStatus.BAD_REQUEST.value(),
            "Validation Error",
            "Request validation failed",
            request.getRequestURI(),
            details
        ));
    }

    @ExceptionHandler(DuplicateResourceException.class)
    public ResponseEntity<ApiErrorResponse> handleDuplicate(
        DuplicateResourceException exception,
        HttpServletRequest request
    ) {
        log.warn("Duplicate resource at path={}, message={}", request.getRequestURI(), exception.getMessage());
        return build(HttpStatus.CONFLICT, "Duplicate Resource", exception.getMessage(), request);
    }

    @ExceptionHandler(BusinessException.class)
    public ResponseEntity<ApiErrorResponse> handleBusiness(
        BusinessException exception,
        HttpServletRequest request
    ) {
        log.warn("Business error at path={}, message={}", request.getRequestURI(), exception.getMessage());
        return build(HttpStatus.BAD_REQUEST, "Business Error", exception.getMessage(), request);
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<ApiErrorResponse> handleNotFound(
        ResourceNotFoundException exception,
        HttpServletRequest request
    ) {
        log.warn("Resource not found at path={}, message={}", request.getRequestURI(), exception.getMessage());
        return build(HttpStatus.NOT_FOUND, "Not Found", exception.getMessage(), request);
    }

    @ExceptionHandler(UnauthorizedException.class)
    public ResponseEntity<ApiErrorResponse> handleUnauthorized(
        UnauthorizedException exception,
        HttpServletRequest request
    ) {
        log.warn("Unauthorized at path={}, message={}", request.getRequestURI(), exception.getMessage());
        return build(HttpStatus.UNAUTHORIZED, "Unauthorized", exception.getMessage(), request);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiErrorResponse> handleUnexpected(
        Exception exception,
        HttpServletRequest request
    ) {
        log.error("Unexpected error at path={}", request.getRequestURI(), exception);
        return build(HttpStatus.INTERNAL_SERVER_ERROR, "Internal Server Error",
            "Beklenmeyen bir hata olustu", request);
    }

    private FieldErrorDetail toDetail(FieldError fieldError) {
        return new FieldErrorDetail(fieldError.getField(), fieldError.getDefaultMessage());
    }

    private ResponseEntity<ApiErrorResponse> build(
        HttpStatus status,
        String error,
        String message,
        HttpServletRequest request
    ) {
        return ResponseEntity.status(status).body(new ApiErrorResponse(
            Instant.now(),
            status.value(),
            error,
            message,
            request.getRequestURI(),
            List.of()
        ));
    }
}
