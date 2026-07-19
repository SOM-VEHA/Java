package com.somveha.spring_bandend.validator;
import lombok.RequiredArgsConstructor;
import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.repository.RoleRepository;
@RequiredArgsConstructor

public class RoleValidator {
    private final RoleRepository roleRepository;

    public  RoleValidator(RoleRepository newRoleRepository){
        this.roleRepository=newRoleRepository;
    }

    public void validate(Long id, RoleRequest request){
        validateDuplicateName(request.getName(), id);
    }

    // Check Duplicate Name
    private void validateDuplicateName(String name, Long id) {
        if ((id == null && roleRepository.existsByName(name)) || (id != null && roleRepository.existsByNameAndIdNot(name, id))) {
            throw new IllegalArgumentException("Role name '" + name + "' already exists.");
        }
    }
}
