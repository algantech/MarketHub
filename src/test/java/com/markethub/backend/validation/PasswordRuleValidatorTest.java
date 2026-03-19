package com.markethub.backend.validation;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.Test;

class PasswordRuleValidatorTest {

    private final PasswordRuleValidator validator = new PasswordRuleValidator();

    @Test
    void requiredPasswordRejectsBlankValue() {
        validator.initialize(annotation(true));

        assertThat(validator.isValid("", null)).isFalse();
    }

    @Test
    void optionalPasswordAllowsBlankValue() {
        validator.initialize(annotation(false));

        assertThat(validator.isValid("", null)).isTrue();
    }

    @Test
    void passwordRuleRequiresMinimumLengthWhenValueExists() {
        validator.initialize(annotation(false));

        assertThat(validator.isValid("1234567", null)).isFalse();
        assertThat(validator.isValid("12345678", null)).isTrue();
    }

    private PasswordRule annotation(boolean required) {
        PasswordRule annotation = mock(PasswordRule.class);
        when(annotation.required()).thenReturn(required);
        return annotation;
    }
}
