package com.example.demo.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.example.demo.domain.SubCategory;
import com.example.demo.dto.request.SubCategoryRequest;
import com.example.demo.dto.response.SubCategoryResponse;
@Mapper(componentModel = "spring")
public interface SubCategoryMapper {
    @Mapping(source = "category.id", target = "categoryId")
    @Mapping(source = "category.title", target = "categoryName")
    SubCategoryResponse toResponse(SubCategory subCategory);
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "category", ignore = true)
    SubCategory toEntity(SubCategoryRequest request);
}
