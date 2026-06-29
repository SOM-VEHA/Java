package com.somveha.spring_bandend.service;

import java.util.List;

import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponce;

public interface RoleService {
    public List<RoleResponce> getAll();

    public List<RoleResponce> FindByName(String name);

    public RoleResponce getById(Long Id);

    public RoleResponce create(RoleRequest roleRequest);

    public RoleResponce update(RoleRequest roleRequest, Long Id);

    public void delete(Long Id);
}
