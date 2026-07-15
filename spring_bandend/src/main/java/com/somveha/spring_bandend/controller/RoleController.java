package com.somveha.spring_bandend.controller;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.somveha.spring_bandend.base.BasePagination;
import com.somveha.spring_bandend.base.BaseSucess;
import com.somveha.spring_bandend.dto.pagination.PageDTO;
import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponse;
import com.somveha.spring_bandend.service.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
@RestController
@RequestMapping("/api/role")
@RequiredArgsConstructor
public class RoleController {
    
    private final RoleService roleService;

    @PostMapping
    public ResponseEntity<BaseSucess<RoleResponse>> create(@RequestBody RoleRequest roleRequest) {
        RoleResponse roleResponse = roleService.create(roleRequest);
        BaseSucess<RoleResponse> response = BaseSucess.<RoleResponse>builder()
                .status(true)
                .code(HttpStatus.OK.value())
                .timestamp(LocalDateTime.now())
                .message("Role created successfully")
                .data(roleResponse)
                .build();
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<BaseSucess<RoleResponse>> getById(@PathVariable("id") Long id) {
        RoleResponse roleResponse = roleService.getById(id);
        BaseSucess<RoleResponse> response = BaseSucess.<RoleResponse>builder()
                .status(true)
                .code(HttpStatus.OK.value())
                .timestamp(LocalDateTime.now())
                .message("Success")
                .data(roleResponse)
                .build();
        return ResponseEntity.ok(response);
    }

    @PutMapping("/{id}")
    public ResponseEntity<BaseSucess<RoleResponse>> update(@PathVariable("id") Long id,
            @RequestBody RoleRequest roleRequest) {
        RoleResponse roles = roleService.update(roleRequest, id);
        BaseSucess<RoleResponse> response = BaseSucess.<RoleResponse>builder()
                .status(true)
                .code(HttpStatus.OK.value())
                .timestamp(LocalDateTime.now())
                .message("Success")
                .data(roles)
                .build();
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable("id") Long id) {
        try {
            roleService.delete(id);
            return ResponseEntity.ok("Role deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to delete role");
        }

    }

    @GetMapping("/search")
    public ResponseEntity<BaseSucess<List<RoleResponse>>> getByname(
            @RequestParam(required = false) Map<String, String> params) {
        List<RoleResponse> roles = roleService.findByName(params);
        BaseSucess<List<RoleResponse>> response = BaseSucess.<List<RoleResponse>>builder()
                .status(true)
                .code(HttpStatus.OK.value())
                .timestamp(LocalDateTime.now())
                .message("Success")
                .data(roles)
                .build();
        return ResponseEntity.ok(response);
    }

    @GetMapping
    public ResponseEntity<?> pagination1(@RequestParam(required = false) Map<String, String> params) {
        Page<RoleResponse> allPagination = roleService.getAllPagination(params);
        PageDTO pageDTO = new PageDTO(allPagination);
        BasePagination<RoleResponse> response = BasePagination.<RoleResponse>builder()
                .status(true)
                .code(HttpStatus.OK.value())
                .message("Success")
                .timestamp(LocalDateTime.now().toString())
                .pagination(pageDTO.getPagination())
                .data(null)
                .build();
        return ResponseEntity.ok(response);
    }
}
