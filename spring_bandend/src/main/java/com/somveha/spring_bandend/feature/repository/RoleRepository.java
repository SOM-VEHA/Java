package com.somveha.spring_bandend.feature.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.somveha.spring_bandend.entity.Role;
public interface RoleRepository extends JpaRepository<Role, Long>, JpaSpecificationExecutor<Role> {
   boolean existsByName(String name);
   boolean existsByNameAndIdNot(String name, Long id);
}
