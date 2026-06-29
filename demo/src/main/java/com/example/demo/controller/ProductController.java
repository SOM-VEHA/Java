package com.example.demo.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;
import com.example.demo.dto.request.ProductRequest;
import com.example.demo.dto.response.ProductResponce;
import com.example.demo.dto.response.RoleResponce.ApiResponse;
import com.example.demo.service.ProductService;
import java.util.List;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/products")
public class ProductController {
    private final ProductService productService;

    @PostMapping
    public ResponseEntity<ApiResponse<ProductResponce>> create(@RequestBody ProductRequest request) {
        ApiResponse<ProductResponce> response = new ApiResponse<>();
        response.setSuccess(true);
        response.setMessage("Product created successfully");
        response.setData(productService.create(request));
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<ProductResponce>>> getAll() {
        ApiResponse<List<ProductResponce>> response = new ApiResponse<>();
        response.setSuccess(true);
        response.setMessage("Products fetched successfully");
        response.setData(productService.getAll());
        return ResponseEntity.ok(response);
    }

    @GetMapping("{id}")
    public ResponseEntity<ApiResponse<ProductResponce>> getById(@PathVariable("id") Long id) {
        ApiResponse<ProductResponce> productResponse = new ApiResponse<>();
        productResponse.setSuccess(true);
        productResponse.setMessage("Products fetched successfully");
        productResponse.setData(productService.getByid(id));
        return ResponseEntity.ok(productResponse);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable Long id){
        productService.delete(id);
        return ResponseEntity.ok("Deleted");
    }
}