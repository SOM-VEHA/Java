package com.example.demo.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.example.demo.domain.Category;
import com.example.demo.dto.request.CategoryRequest;
import com.example.demo.dto.response.CategoryResponse;

@Mapper(componentModel = "spring")
public interface CategoryMapper {
    CategoryResponse toResponse(Category category);
    @Mapping(target = "id", ignore = true)
    Category toCategory(CategoryRequest categoryRequest);
}
