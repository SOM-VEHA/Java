package com.example.demo.service;
import java.util.List;
import com.example.demo.dto.request.CategoryRequest;
import com.example.demo.dto.response.CategoryResponse;
public interface CategoryService {

    List<CategoryResponse> getAll();

    CategoryResponse create(CategoryRequest categoryRequest);

    CategoryResponse getById(Long id);

    CategoryResponse update(Long id, CategoryRequest categoryRequest);

    void delete(long id);
}