package com.somveha.spring_bandend.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.somveha.spring_bandend.dto.ApiResponse;
import com.somveha.spring_bandend.dto.pagination.PageDTO;
import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponce;
import com.somveha.spring_bandend.service.RoleService;
import lombok.RequiredArgsConstructor;
import com.somveha.spring_bandend.dto.pagination.PaginationPage;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
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
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    @PostMapping
    public ResponseEntity<ApiResponse<RoleResponce>> create(@RequestBody RoleRequest roleRequest) {
        ApiResponse<RoleResponce> responce = new ApiResponse<>();
        RoleResponce roleResponce = roleService.create(roleRequest);
        responce.setStatus(true);
        responce.setCode(200);
        responce.setTimestamp(LocalDateTime.now().format(formatter));
        responce.setMessage("Success");
        responce.setData(roleResponce);
        return ResponseEntity.ok(responce);
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<RoleResponce>>> getAll() {
        ApiResponse<List<RoleResponce>> responce = new ApiResponse<>();
        List<RoleResponce> roleResponce = roleService.getAll();
        responce.setStatus(true);
        responce.setCode(200);
        responce.setTimestamp(LocalDateTime.now().format(formatter));
        responce.setMessage("Success");
        responce.setData(roleResponce);
        return ResponseEntity.ok(responce);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<RoleResponce>> getById(@PathVariable("id") Long id) {
        ApiResponse<RoleResponce> response = new ApiResponse<>();
        try {
            RoleResponce roleResponce = roleService.getById(id);
            response.setStatus(true);
            response.setCode(200);
            response.setMessage("Success");
            response.setTimestamp(LocalDateTime.now().format(formatter));
            response.setData(roleResponce);
        } catch (Exception e) {
            response.setStatus(false);
            response.setCode(500);
            response.setMessage("Failed");
            response.setData(null);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
        return ResponseEntity.ok(response);
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse<RoleResponce>> putMethodName(@PathVariable("id") Long Id,
            @RequestBody RoleRequest roleRequest) {
        ApiResponse<RoleResponce> responce = new ApiResponse<>();
        try {
            RoleResponce roles = roleService.update(roleRequest, Id);
            responce.setStatus(true);
            responce.setCode(200);
            responce.setTimestamp(LocalDateTime.now().format(formatter));
            responce.setMessage("Success");
            responce.setData(roles);
            return ResponseEntity.ok(responce);
        } catch (Exception e) {
            responce.setStatus(false);
            responce.setMessage("Failed");
            responce.setData(null);
            return ResponseEntity.ok(responce);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse<String>> delete(@PathVariable("id") Long Id) {
        ApiResponse<String> responce = new ApiResponse<>();
        roleService.delete(Id);
        responce.setStatus(true);
        responce.setTimestamp(LocalDateTime.now().format(formatter));
        responce.setMessage("Delete successful");
        responce.setData("Delete successful");
        return ResponseEntity.ok(responce);
    }

    @GetMapping("/search")
    public ResponseEntity<ApiResponse<List<RoleResponce>>> getByname(@RequestParam String name) {
        ApiResponse<List<RoleResponce>> response = new ApiResponse<>();
        try {
            List<RoleResponce> roles = roleService.FindByName(name);
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

    // @GetMapping("/pagination")
    // public ResponseEntity<Page<RoleResponce>>
    // getMethodName(@RequestParam(defaultValue = "0") int
    // page,@RequestParam(defaultValue = "10") int size) {
    // Page<RoleResponce> pageResponce = roleService.getAllPagination(page, size);
    // PaginationPage pagination = new PaginationPage();
    // pagination.setEmpty(pageResponce.isEmpty());
    // pagination.setFirst(pageResponce.isFirst());
    // pagination.setLast(pageResponce.isLast());
    // pagination.setNumberOfElements(pageResponce.getNumberOfElements());
    // pagination.setPageNumber(pageResponce.getNumber());
    // pagination.setPageSize(pageResponce.getSize());
    // pagination.setTotalElements(pageResponce.getTotalElements());
    // pagination.setTotalPages(pageResponce.getTotalPages());

    // ApiResponse<List<RoleResponce>> response = new ApiResponse<>();
    // response.setStatus(true);
    // response.setCode(200);
    // response.setMessage("Success");
    // response.setTimestamp(LocalDateTime.now().format(formatter));
    // response.setPagination(pagination);
    // response.setData(pageResponce.getContent());
    // return ResponseEntity.ok(pageResponce);
    // }

    // @GetMapping("/pagination1")
    // public ResponseEntity<ApiResponse<PageDTO>>
    // getMethodName1(@RequestParam(defaultValue = "0") int
    // page,@RequestParam(defaultValue = "10") int size) {
    // Page<RoleResponce> result = roleService.getAllPagination(page, size);

    // ApiResponse<List<RoleResponce>> response =
    // ApiResponse.<List<RoleResponce>>builder()
    // .status(true)
    // .code(200)
    // .message("Success")
    // .timestamp(LocalDateTime.now()
    // .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
    // .pagination(new PageDTO(result).getPagination())
    // .data(result.getContent())
    // .build();

    // return ResponseEntity.ok(response);
    // }

    @GetMapping("/pagination1")
    public ResponseEntity<ApiResponse<List<RoleResponce>>> getAll(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {

        Page<RoleResponce> result = roleService.getAllPagination(page, size);

        ApiResponse<List<RoleResponce>> response = ApiResponse.<List<RoleResponce>>builder()
                .status(true)
                .code(200)
                .message("Success")
                .timestamp(LocalDateTime.now()
                        .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
                .pagination(new PageDTO(result).getPagination())
                .data(result.getContent())
                .build();

        return ResponseEntity.ok(response);
    }
}
