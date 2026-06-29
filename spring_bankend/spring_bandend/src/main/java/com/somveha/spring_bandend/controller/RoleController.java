package com.somveha.spring_bandend.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.somveha.spring_bandend.dto.ApiResponse;
import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponce;
import com.somveha.spring_bandend.service.RoleService;
import lombok.RequiredArgsConstructor;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/roles")
public class RoleController {
    private final RoleService roleService;

    @PostMapping
    public ResponseEntity<RoleResponce> create(@RequestBody RoleRequest roleRequest) {
        RoleResponce roleResponce = roleService.create(roleRequest);
        return ResponseEntity.ok(roleResponce);
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<RoleResponce>>> getAll() {
        ApiResponse<List<RoleResponce>> responce = new ApiResponse<>();
        List<RoleResponce> roleResponce = roleService.getAll();
        responce.setSuccess(true);
        responce.setMessage("sucessfull");
        responce.setData(roleResponce);
        return ResponseEntity.ok(responce);
    }
    // public List<RoleResponce> getAll() {
    // return roleService.getAll();
    // }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<RoleResponce>> getById(@PathVariable("id") Long Id) {
        RoleResponce roleResponce = roleService.getById(Id);
        ApiResponse<RoleResponce> responce = new ApiResponse<>();

        try {
            responce.setSuccess(true);
            responce.setMessage("sucessfull");
            responce.setData(roleResponce);
            return ResponseEntity.ok(responce);
        } catch (Exception e) {
            responce.setSuccess(false);
            responce.setMessage("faile");
            responce.setData(roleResponce);
            return ResponseEntity.ok(responce);
        }
    }
    // public RoleResponce getById(@PathVariable("id") Long Id) {
    // return roleService.getById(Id);
    // }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse<RoleResponce>> putMethodName(@PathVariable("id") Long Id,
            @RequestBody RoleRequest roleRequest) {
        ApiResponse<RoleResponce> responce = new ApiResponse<>();
        try {
            RoleResponce roles = roleService.update(roleRequest, Id);
            responce.setSuccess(true);
            responce.setMessage("sucessfull");
            responce.setData(roles);
            return ResponseEntity.ok(responce);
        } catch (Exception e) {
            responce.setSuccess(false);
            responce.setMessage("faile");
            responce.setData(null);
            return ResponseEntity.ok(responce);
        }
    }
    // public ResponseEntity<RoleResponce> putMethodName(@PathVariable("id") Long
    // Id,@RequestBody RoleRequest roleRequest) {
    // ApiResponse<RoleResponce> responce=new ApiResponse<>();
    // RoleResponce roleResponce = roleService.update(roleRequest, Id);
    // return ResponseEntity.ok(response);
    // }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse<String>> delete(@PathVariable("id") Long Id) {
        ApiResponse<String> responce = new ApiResponse<>();
        roleService.delete(Id);
        responce.setSuccess(true);
        responce.setMessage("Delete sucessful");
        responce.setData("Delete sucessful");
        return ResponseEntity.ok(responce);
    }
    // public ResponseEntity<String> delete(@PathVariable("id") Long Id) {
    // roleService.delete(Id);
    // return ResponseEntity.ok("Delete Item sucessfull");
    // }

    @GetMapping("/search")
    public ResponseEntity<ApiResponse<List<RoleResponce>>> getByname(@RequestParam String name) {
        ApiResponse<List<RoleResponce>> response = new ApiResponse<>();
        try {
            List<RoleResponce> roles = roleService.FindByName(name);
            response.setSuccess(true);
            response.setMessage("Successful");
            response.setData(roles);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.setSuccess(false);
            response.setMessage(e.getMessage());
            response.setData(null);
            return ResponseEntity.badRequest().body(response);
        }
    }

}
