package com.example.demo.service.impl;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.example.demo.repository.RoleRepository;
import com.example.demo.service.RoleService;

import lombok.RequiredArgsConstructor;
import com.example.demo.domain.Role;
import com.example.demo.dto.request.RoleRequest.RoleRequest;
import com.example.demo.dto.response.RoleResponce.RoleResponse;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {

    private final RoleRepository roleRepository;

    @Override

    public RoleResponse createRole(RoleRequest rolerequest) {
        Role roleEntity = new Role();
        roleEntity.setName(rolerequest.getName());
        roleEntity.setDescription(rolerequest.getDescription());
        Role savedRole = roleRepository.save(roleEntity);
        RoleResponse response = new RoleResponse();
        response.setId(savedRole.getId());
        response.setName(savedRole.getName());
        response.setDescription(savedRole.getDescription());
        return response;
    }

    @Override
    public RoleResponse updateRole(RoleRequest rolerequest, Long roleId) {
        Role roleEntity = roleRepository.findById(roleId).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Role not found"));
        roleEntity.setName(rolerequest.getName());
        roleEntity.setDescription(rolerequest.getDescription());
        Role savedRole = roleRepository.save(roleEntity);
        RoleResponse response = new RoleResponse();
        response.setId(savedRole.getId());
        response.setName(savedRole.getName());
        response.setDescription(savedRole.getDescription());
        return response;
    }

    @Override
    public void deleteRole(Long roleId) {
        roleRepository.deleteById(roleId);
    }

    @Override
    public List<RoleResponse> getAll() {
        return roleRepository.findAll().stream().map(
            role -> {
            RoleResponse response = new RoleResponse();
            response.setId(role.getId());
            response.setName(role.getName());
            response.setDescription(role.getDescription());
            return response;
        }).toList();
    }

    @Override
    public List<RoleResponse> getAllById(Long Id) {
        List<Role> roles = roleRepository.findAllById(List.of(Id));
        if (roles.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Role not found with id: " + Id);
        } else {
            return roleRepository.findAllById(List.of(Id)).stream().map(role -> {
                RoleResponse response = new RoleResponse();
                response.setId(role.getId());
                response.setName(role.getName());
                response.setDescription(role.getDescription());
                return response;
            }).toList();
        }
    }
}
