package com.somveha.spring_bandend.feature.service;
import java.util.List;
import java.util.Map;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;
import com.somveha.spring_bandend.dto.response.RoleImportResult;
import com.somveha.spring_bandend.feature.dto.filter.RoleFilter;
import com.somveha.spring_bandend.feature.dto.request.RoleRequest;
import com.somveha.spring_bandend.feature.dto.response.RoleResponse;
public interface RoleService {
    
    RoleResponse getById(Long Id);

    RoleResponse create(RoleRequest roleRequest);

    RoleResponse update(RoleRequest roleRequest, Long id);

    void delete(Long id);

    // List<RoleResponse> findByName(Map<String, String> params);

    List<RoleResponse> getAllFilter(RoleFilter filter);

    // Page<RoleResponse> getAll(Map<String, String> params);

    RoleImportResult importFromXlsx(MultipartFile file);

    byte[] exportToXlsx();

    Page<RoleResponse> getAllPaginationFilter(RoleFilter filter);

}