package com.somveha.spring_bandend.repository;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.somveha.spring_bandend.entity.Role;
public interface RoleRepository extends JpaRepository<Role, Long> {
    List<Role> findByName(String name);
}
