package com.example.demo.service.impl;
import org.springframework.stereotype.Service;
import com.example.demo.domain.Category;
import com.example.demo.dto.request.CategoryRequest;
import com.example.demo.dto.response.CategoryResponse;
import com.example.demo.mapper.CategoryMapper;
import com.example.demo.repository.CategoryRepository;
import com.example.demo.service.CategoryService;
import java.util.List;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;
    private final CategoryMapper categoryMapper;

    @Override
    public List<CategoryResponse> getAll() {
        List<Category> categories = categoryRepository.findAll();
        List<CategoryResponse> categoryResponses = categories.stream().map(categoryMapper::toResponse).toList();
        return categoryResponses;
    }

    @Override
    public CategoryResponse create(CategoryRequest categoryRequest) {
        Category category = categoryMapper.toCategory(categoryRequest);
        Category saveCategory = categoryRepository.save(category);
        return  categoryMapper.toResponse(saveCategory);
    }

    @Override
    public CategoryResponse getById(Long id) {
        Category category = categoryRepository.findById(id).orElseThrow(() -> new RuntimeException(""));
        return categoryMapper.toResponse(category);
    }

    @Override
    public CategoryResponse update(Long id, CategoryRequest categoryRequest) {
        Category category = categoryRepository.findById(id).orElseThrow(() -> new RuntimeException(""));
        category.setTitle(categoryRequest.getTitle());
        category.setDescription(categoryRequest.getDescription());
        category.setImage(categoryRequest.getImage());
        category.setStatus(categoryRequest.isStatus());
        Category categoryUpdate = categoryRepository.save(category);
        return categoryMapper.toResponse(categoryUpdate);
    }

    @Override
    public void delete(long id) {
        if (!categoryRepository.existsById(id)) {
            throw new RuntimeException("Category not found with id: " + id);
        }
        categoryRepository.deleteById(id);
    }
}
