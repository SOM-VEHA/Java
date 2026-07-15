package com.somveha.spring_bandend.normalizer;

import org.springframework.stereotype.Component;

import com.somveha.spring_bandend.dto.request.RoleRequest;
@Component
public class RoleNormalizer {
    public RoleRequest normalize(RoleRequest roleRequest) {
        roleRequest.setName(NormalizeName(roleRequest.getName()));
        roleRequest.setDescription(NormalizeDescription(roleRequest.getDescription()));
        return roleRequest;
    }

    private String NormalizeName(String name) {
        return name.trim();
    }

    private String NormalizeDescription(String description) {
        return description.trim();
    }
}
