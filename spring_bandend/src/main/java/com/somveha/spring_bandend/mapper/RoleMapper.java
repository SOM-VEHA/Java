package com.somveha.spring_bandend.mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponse;
import com.somveha.spring_bandend.entity.Role;

@Mapper(componentModel = "spring")
public interface RoleMapper {
    
    @Mapping(target = "id", ignore = true)
    ///to entity
    public Role toEntity(RoleRequest request);
    ///to Response
    public RoleResponse toResponse(Role role);
    ///update Role
    public void updateEntity(@MappingTarget Role target, RoleRequest request);
}
