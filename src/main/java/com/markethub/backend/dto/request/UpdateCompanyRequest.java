package com.markethub.backend.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record UpdateCompanyRequest(
    @NotBlank(message = "Firma adi bos olamaz")
    @Size(min = 2, max = 150, message = "Firma adi 2-150 karakter arasinda olmali")
    String name,
    boolean active
) {
}
