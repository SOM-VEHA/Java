package com.somveha.spring_bandend.service.implement;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponse;
import com.somveha.spring_bandend.entity.Role;
import com.somveha.spring_bandend.exception.ResourceNotFoundException;
import com.somveha.spring_bandend.mapper.RoleMapper;
import com.somveha.spring_bandend.repository.RoleRepository;
import com.somveha.spring_bandend.service.RoleService;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Service
public class RoleServiceImpl implements RoleService {
    private final RoleRepository roleRepository;
    private final RoleMapper roleMapper;

    @Override
    public List<RoleResponse> getAll() {
        List<Role> roles = roleRepository.findAll();
        List<RoleResponse> responces=roles.stream().map(roleMapper::toResponse).toList();
        return responces;
    }

    public RoleResponse getById(Long id) {
        Role role = roleRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Role not found with id: " + id));
        return roleMapper.toResponse(role);
    }

    @Override
    public RoleResponse create(RoleRequest roleRequest) {
        Role role = roleMapper.toEntity(roleRequest);
        Role savedRole = roleRepository.save(role);
        RoleResponse responce=roleMapper.toResponse(savedRole);
        return responce;
    }

    @Override
    public RoleResponse update(RoleRequest request, Long id) {
        Role role = roleRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Role not found with id: " + id));
        role.setName(request.getName());
        role.setDescription(request.getDescription());
        return roleMapper.toResponse(roleRepository.save(role));
    }

    @Override
    public void delete(Long id) {
        Role role = roleRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Role not found with id: " + id));
        roleRepository.delete(role);
    }

    @Override
    public List<RoleResponse> FindByName(String name) {
        List<Role> role=roleRepository.findByName(name);
        List<RoleResponse> responces=role.stream().map(roleMapper::toResponse).toList();
        return responces;
    }

    @Override
    public Page<RoleResponse> getAllPagination(int page, int size) {
        size=Math.min(size,100);
        Pageable pageable =PageRequest.of(page, size);
        Page<Role> role=roleRepository.findAll(pageable);
        Page<RoleResponse> response=role.map(roleMapper::toResponse);
        return response;
    }
}