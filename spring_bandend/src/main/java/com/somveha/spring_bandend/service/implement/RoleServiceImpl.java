package com.somveha.spring_bandend.service.implement;

import java.util.List;
import java.util.Map;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponse;
import com.somveha.spring_bandend.entity.Role;
import com.somveha.spring_bandend.exception.ResourceNotFoundException;
import com.somveha.spring_bandend.mapper.RoleMapper;
import com.somveha.spring_bandend.normalizer.RoleNormalizer;
import com.somveha.spring_bandend.repository.RoleRepository;
import com.somveha.spring_bandend.service.RoleService;
import com.somveha.spring_bandend.specification.RoleSpecification;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class RoleServiceImpl implements RoleService {
    private final RoleRepository roleRepository;
    private final RoleMapper roleMapper;
    private final RoleNormalizer roleNormalizer;

    @Override
    public RoleResponse getById(Long id) {
        Role role = roleRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Role not found with id: " + id));
        return roleMapper.toResponse(role);
    }

    @Override
    public RoleResponse create(RoleRequest roleRequest) {
        Role entity = roleMapper.toEntity(roleNormalizer.normalize(roleRequest));
        return roleMapper.toResponse(roleRepository.save(entity));
    }

    @Override
    public RoleResponse update(RoleRequest request, Long id) {
        Role role = roleRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Role not found with id: " + id));
        role.setName(roleNormalizer.normalize(request).getName());
        role.setDescription(roleNormalizer.normalize(request).getDescription());
        return roleMapper.toResponse(roleRepository.save(role));
    }

    @Override
    public void delete(Long id) {
        Role role = roleRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Role not found with id: " + id));
        roleRepository.delete(role);
    }

    @Override
    public List<RoleResponse> findByName(Map<String, String> params) {
        Specification<Role> spec = RoleSpecification.builderSpecification(params);
        return roleRepository.findAll(spec).stream().map(roleMapper::toResponse).toList();
    }

    @Override
    public Page<RoleResponse> getAllPagination(Map<String, String> params) {

        // size = Math.min(size, 100);
        // Pageable pageable = PageRequest.of(page, size);
        // Page<Role> role = roleRepository.findAll(pageable);
        // Page<RoleResponse> response = role.map(roleMapper::toResponse);
        // return response;
        int page = Integer.parseInt(params.getOrDefault("page", "0"));
        int size = Integer.parseInt(params.getOrDefault("size", "10"));
        size = Math.min(size, 100);
        Pageable pageable = PageRequest.of(page, size);
        Page<Role> roles = roleRepository.findAll(pageable);
        return roles.map(roleMapper::toResponse);
    }
}