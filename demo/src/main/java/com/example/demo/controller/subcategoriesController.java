package com.example.demo.controller;

import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.dto.response.SubCategoryResponse;
import com.example.demo.service.SubcategoryService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/subcategories/categories")
public class subcategoriesController {
    private final SubcategoryService subcategoryService;

    @GetMapping("/{categoryId}")
    public ResponseEntity<List<SubCategoryResponse>> getByCategory(@PathVariable Long categoryId) {
        List<SubCategoryResponse> subCategoryResponses = subcategoryService.getAllByCategory(categoryId);
        return ResponseEntity.ok(subCategoryResponses);
    }
}
