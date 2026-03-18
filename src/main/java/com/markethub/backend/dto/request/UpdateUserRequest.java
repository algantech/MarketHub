package com.markethub.backend.dto.request;

import com.markethub.backend.domain.Role;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import java.util.Set;

public record UpdateUserRequest(
    @NotBlank(message = "Firma secimi zorunludur")
    String companyId,
    @NotBlank(message = "Kullanici adi bos olamaz")
    @Size(min = 3, max = 50, message = "Kullanici adi 3-50 karakter arasinda olmali")
    String username,
    @Size(min = 8, max = 100, message = "Sifre en az 8 karakter olmali")
    String password,
    @NotBlank(message = "Ad soyad bos olamaz")
    @Size(max = 120, message = "Ad soyad en fazla 120 karakter olabilir")
    String fullName,
    @Email(message = "Gecerli bir e-posta giriniz")
    @NotBlank(message = "E-posta zorunludur")
    String email,
    @NotEmpty(message = "En az bir rol secilmelidir")
    Set<Role> roles,
    boolean active
) {
}
