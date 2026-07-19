package com.somveha.spring_bandend.service;
import java.util.List;
import java.util.Map;
import org.springframework.data.domain.Page;
import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponse;
public interface RoleService {
    
    RoleResponse getById(Long Id);

    RoleResponse create(RoleRequest roleRequest);

    RoleResponse update(RoleRequest roleRequest, Long Id);

    void delete(Long Id);

    List<RoleResponse> findByName(Map<String, String> params);

    Page<RoleResponse> getAll(Map<String, String> params);
    RoleImportResult importFromXlsx(MultipartFile file);
}
