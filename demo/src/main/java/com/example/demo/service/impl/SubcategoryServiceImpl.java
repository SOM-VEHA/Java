package com.example.demo.service.impl;
import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.domain.SubCategory;
import com.example.demo.dto.response.SubCategoryResponse;
import com.example.demo.mapper.SubCategoryMapper;
import com.example.demo.repository.SubCategoryRepository;
import com.example.demo.service.SubcategoryService;
import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class SubcategoryServiceImpl implements SubcategoryService {
    private final SubCategoryRepository subCategoryRepository;
    private final SubCategoryMapper subCategoryMapper;
    @Override
    public List<SubCategoryResponse> getAllByCategory(Long categoryId) {
        List<SubCategory> subCategories = subCategoryRepository.findByCategoryId(categoryId);
        List<SubCategoryResponse> subCategoryResponses = subCategories.stream().map(subCategoryMapper::toResponse).toList();
        return subCategoryResponses;
    }

}
