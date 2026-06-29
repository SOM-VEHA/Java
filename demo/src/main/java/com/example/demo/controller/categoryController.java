package com.example.demo.controller;
import java.util.List;
import com.example.demo.dto.request.CategoryRequest;
import com.example.demo.dto.response.CategoryResponse;
import com.example.demo.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/categories")
public class categoryController {
    private final CategoryService serviceCategoryService;
    @GetMapping
    public ResponseEntity<List<CategoryResponse>> getAll() {
        List<CategoryResponse> categoryResponse=serviceCategoryService.getAll();
        return ResponseEntity.ok(categoryResponse);
    }
    @PostMapping
    public ResponseEntity<CategoryResponse> create(@RequestBody CategoryRequest categoryRequest) {
        CategoryResponse categoryResponse=serviceCategoryService.create(categoryRequest);
        return ResponseEntity.ok(categoryResponse);
    }
    @PutMapping("/{id}")
    public ResponseEntity<CategoryResponse> update(@PathVariable Long id, @RequestBody CategoryRequest categoryRequest) {
        CategoryResponse categoryResponse=serviceCategoryService.update(id, categoryRequest);
        return ResponseEntity.ok(categoryResponse);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable Long id) {
        serviceCategoryService.delete(id);
        return ResponseEntity.ok("Delete Sucessfull");
    }
}
