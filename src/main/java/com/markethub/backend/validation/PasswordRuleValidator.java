package com.markethub.backend.validation;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.util.StringUtils;

public class PasswordRuleValidator implements ConstraintValidator<PasswordRule, String> {

    private boolean required;

    @Override
    public void initialize(PasswordRule constraintAnnotation) {
        required = constraintAnnotation.required();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (!StringUtils.hasText(value)) {
            return !required;
        }
        return value.trim().length() >= 8;
    }
}
