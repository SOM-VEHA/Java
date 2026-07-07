package com.somveha.spring_bandend.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponse;

public interface RoleService {
    
    List<RoleResponse> getAll();

    RoleResponse getById(Long Id);

    RoleResponse create(RoleRequest roleRequest);

    RoleResponse update(RoleRequest roleRequest, Long Id);

    void delete(Long Id);

    List<RoleResponse> FindByName(String name);

    Page<RoleResponse> getAllPagination(int page,int size);
}
