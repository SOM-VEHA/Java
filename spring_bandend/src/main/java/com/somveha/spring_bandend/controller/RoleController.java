package com.somveha.spring_bandend.controller;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.somveha.spring_bandend.base.BaseSucess;
import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponse;
import com.somveha.spring_bandend.service.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/role")
public class RoleController {
    private final RoleService roleService;
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    @PostMapping
    public ResponseEntity<BaseSucess<RoleResponse>> create(@RequestBody RoleRequest roleRequest) {
        // BaseSucess<RoleResponse> response = BaseSucess.<RoleResponse>builder()
        // .status(true)
        // .code(HttpStatus.OK.value())
        // .timestamp(LocalDateTime.now().format(formatter))
        // .message("Role created successfully")
        // .data(roleResponse)
        // .build();

        BaseSucess<RoleResponse> response = new BaseSucess<>();
        RoleResponse roleResponse = roleService.create(roleRequest);
        response.setStatus(true);
        response.setCode(HttpStatus.OK.value());
        response.setTimestamp(LocalDateTime.now().format(formatter));
        response.setMessage("Role created successfully");
        response.setData(roleResponse);
        return ResponseEntity.ok(response);
    }

    @GetMapping
    public ResponseEntity<BaseSucess<List<RoleResponse>>> getAllRoles() {
        BaseSucess<List<RoleResponse>> response = new BaseSucess<>();
        List<RoleResponse> roleResponse = roleService.getAll();
        response.setStatus(true);
        response.setCode(HttpStatus.OK.value());
        response.setMessage("Get all roles successfully");
        response.setData(roleResponse);
        response.setTimestamp(LocalDateTime.now().format(formatter));
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<BaseSucess<RoleResponse>> getById(@PathVariable("id") Long id) {
        BaseSucess<RoleResponse> response = new BaseSucess<>();
        try {
            RoleResponse roleResponse = roleService.getById(id);
            response.setStatus(true);
            response.setCode(HttpStatus.OK.value());
            response.setMessage("Success");
            response.setTimestamp(LocalDateTime.now().format(formatter));
            response.setData(roleResponse);
        } catch (Exception e) {
            response.setStatus(false);
            response.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
            response.setMessage("Failed");
            response.setTimestamp(LocalDateTime.now().format(formatter));
            response.setData(null);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
        return ResponseEntity.ok(response);
    }

    @PutMapping("/{id}")
    public ResponseEntity<BaseSucess<RoleResponse>> update(@PathVariable("id") Long Id,
            @RequestBody RoleRequest roleRequest) {
        BaseSucess<RoleResponse> response = new BaseSucess<>();
        try {
            RoleResponse roles = roleService.update(roleRequest, Id);
            response.setStatus(true);
            response.setCode(200);
            response.setTimestamp(LocalDateTime.now().format(formatter));
            response.setMessage("Success");
            response.setData(roles);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.setStatus(false);
            response.setMessage("Failed");
            response.setData(null);
            return ResponseEntity.ok(response);
        }
    }

    @GetMapping("/search")
    public ResponseEntity<BaseSucess<List<RoleResponse>>> getByname(@RequestParam String name) {
        BaseSucess<List<RoleResponse>> response = new BaseSucess<>();
        try {
            List<RoleResponse> roles = roleService.FindByName(name);
            response.setStatus(true);
            response.setTimestamp(LocalDateTime.now().format(formatter));
            response.setMessage("Successful");
            response.setData(roles);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.setStatus(false);
            response.setTimestamp(LocalDateTime.now().format(formatter));
            response.setMessage(e.getMessage());
            response.setData(null);
            return ResponseEntity.badRequest().body(response);
        }
    }
}
