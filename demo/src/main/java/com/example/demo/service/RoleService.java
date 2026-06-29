package com.example.demo.service;

import com.example.demo.dto.request.RoleRequest.RoleRequest;
import com.example.demo.dto.response.RoleResponce.RoleResponse;
import java.util.List;

import org.springframework.stereotype.Service;
@Service
public interface RoleService {
    List<RoleResponse> getAll();

    List<RoleResponse> getAllById(Long Id);

    public RoleResponse createRole(RoleRequest rolerequest);

    public RoleResponse updateRole(RoleRequest rolerequest, Long roleId);

    public void deleteRole(Long roleId);
}
