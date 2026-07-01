package com.somveha.spring_bandend.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponce;

public interface RoleService {
    List<RoleResponce> getAll();

    RoleResponce getById(Long Id);

    RoleResponce create(RoleRequest roleRequest);

    RoleResponce update(RoleRequest roleRequest, Long Id);

    void delete(Long Id);

    List<RoleResponce> FindByName(String name);

    Page<RoleResponce> getAllPagination(int page,int size);
}
