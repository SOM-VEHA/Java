package com.somveha.spring_bandend.feature.validator;
import com.somveha.spring_bandend.feature.dto.request.RoleRequest;
import com.somveha.spring_bandend.feature.repository.RoleRepository;
import org.springframework.stereotype.Component;
@Component
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
