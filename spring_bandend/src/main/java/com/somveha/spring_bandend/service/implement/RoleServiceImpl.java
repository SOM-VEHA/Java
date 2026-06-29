package com.somveha.spring_bandend.service.implement;
import java.util.List;
import org.springframework.stereotype.Service;

import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponce;
import com.somveha.spring_bandend.entity.Role;
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
    public List<RoleResponce> getAll() {
        List<Role> roles = roleRepository.findAll();
        List<RoleResponce> responces=roles.stream().map(roleMapper::toResponse).toList();
        return responces;
    }

    public RoleResponce getById(Long Id) {
        Role role = roleRepository.findById(Id).orElseThrow(() -> new RuntimeException("Role not found with id: " + Id));
        RoleResponce responce= roleMapper.toResponse(role);
        return responce;
    }

    @Override
    public RoleResponce create(RoleRequest roleRequest) {
        Role role = roleMapper.toEntity(roleRequest);
        Role savedRole = roleRepository.save(role);
        RoleResponce responce=roleMapper.toResponse(savedRole);
        return responce;
    }

    @Override
    public RoleResponce update(RoleRequest roleRequest, Long Id) {
        Role role = roleRepository.findById(Id).orElseThrow(() -> new RuntimeException("Role not found with id: " + Id));
        role.setName(roleRequest.getName());
        role.setDescription(roleRequest.getDescription());
        Role updatedRole = roleRepository.save(role);
        RoleResponce responce=roleMapper.toResponse(updatedRole);
        return responce;
    }

    @Override
    public void delete(Long Id) {
        Role role = roleRepository.findById(Id).orElseThrow(() -> new RuntimeException("Role not found with id: " + Id));
        roleRepository.delete(role);
    }

    @Override
    public List<RoleResponce> FindByName(String name) {
        List<Role> role=roleRepository.findByName(name);
        List<RoleResponce> responces=role.stream().map(roleMapper::toResponse).toList();
        return responces;
    }

}