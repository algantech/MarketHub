package com.markethub.backend.security;

import com.markethub.backend.domain.Role;
import com.markethub.backend.domain.User;
import com.markethub.backend.domain.UserType;
import java.util.Collection;
import java.util.Set;
import java.util.stream.Stream;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class AuthenticatedUser implements UserDetails {

    private final String id;
    private final String username;
    private final String passwordHash;
    private final String fullName;
    private final String email;
    private final UserType userType;
    private final String companyId;
    private final Set<Role> roles;
    private final boolean active;

    public AuthenticatedUser(
        String id,
        String username,
        String passwordHash,
        String fullName,
        String email,
        UserType userType,
        String companyId,
        Set<Role> roles,
        boolean active
    ) {
        this.id = id;
        this.username = username;
        this.passwordHash = passwordHash;
        this.fullName = fullName;
        this.email = email;
        this.userType = userType;
        this.companyId = companyId;
        this.roles = roles;
        this.active = active;
    }

    public static AuthenticatedUser from(User user) {
        return new AuthenticatedUser(
            user.getId(),
            user.getUsername(),
            user.getPasswordHash(),
            user.getFullName(),
            user.getEmail(),
            user.getUserType(),
            user.getCompanyId(),
            user.getRoles(),
            user.isActive()
        );
    }

    public String getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public UserType getUserType() {
        return userType;
    }

    public String getCompanyId() {
        return companyId;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Stream<SimpleGrantedAuthority> roleAuthorities = roles.stream()
            .map(role -> new SimpleGrantedAuthority(role.name()));
        Stream<SimpleGrantedAuthority> typeAuthority = Stream.of(new SimpleGrantedAuthority(userType.name()));
        return Stream.concat(typeAuthority, roleAuthorities).toList();
    }

    @Override
    public String getPassword() {
        return passwordHash;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return active;
    }

    @Override
    public boolean isAccountNonLocked() {
        return active;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return active;
    }

    @Override
    public boolean isEnabled() {
        return active;
    }
}
