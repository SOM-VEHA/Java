package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.http.ResponseEntity;
import com.example.demo.dto.request.RoleRequest.RoleRequest;
import com.example.demo.dto.response.RoleResponce.ApiResponse;
import com.example.demo.dto.response.RoleResponce.RoleResponse;
import com.example.demo.service.RoleService;

import lombok.RequiredArgsConstructor;
import java.util.List;

@RestController
@RequestMapping("/api/roles")
@RequiredArgsConstructor
public class RoleController {
    private final RoleService roleService;//// call service

    @PostMapping
    public ResponseEntity<RoleResponse> create(@RequestBody RoleRequest roleRequest) {
        RoleResponse createdRole = roleService.createRole(roleRequest);
        return ResponseEntity.ok(createdRole);
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<RoleResponse>>> getAllRoles() {
        ApiResponse<List<RoleResponse>> response = new ApiResponse<>();
        response.setSuccess(true);
        response.setMessage("Roles fetched successfully");
        response.setData(roleService.getAll());
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{roleId}")
    public ResponseEntity<ApiResponse<List<RoleResponse>>> getAllById(@PathVariable Long roleId) {
        ApiResponse<List<RoleResponse>> response = new ApiResponse<>();
        try {
            response.setSuccess(true);
            response.setMessage("Role fetched successfully");
            response.setData(roleService.getAllById(roleId));
            return ResponseEntity.ok(response);
        } catch (RuntimeException ex) {
            response.setSuccess(false);
            response.setMessage(ex.getMessage());
            return ResponseEntity.status(404).body(response);
        }
    }

    @PutMapping("/{roleId}")
    public  ResponseEntity<RoleResponse>  update(@PathVariable Long roleId, @RequestBody RoleRequest roleRequest) {
        RoleResponse updatedRole = roleService.updateRole(roleRequest, roleId);
        return ResponseEntity.ok(updatedRole);
    }

    @DeleteMapping("/{roleId}")
    public ResponseEntity<String> delete(@PathVariable Long roleId) {
        roleService.deleteRole(roleId);
        return ResponseEntity.ok("Role deleted successfully!");
    }
}