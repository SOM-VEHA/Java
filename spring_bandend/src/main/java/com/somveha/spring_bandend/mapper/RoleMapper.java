package com.somveha.spring_bandend.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponce;
import com.somveha.spring_bandend.entity.Role;

@Mapper(componentModel = "spring")
public interface RoleMapper {
    
    @Mapping(target = "id", ignore = true)

    public Role toEntity(RoleRequest request);

    public RoleResponce toResponse(Role role);
}
