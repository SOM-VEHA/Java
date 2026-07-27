package com.example.demo.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

import com.example.demo.dto.request.ProductRequest;
import com.example.demo.dto.response.ProductResponse;
import com.example.demo.entity.Product;

@Mapper(componentModel = "spring")
public interface ProductMapper {
    @Mapping(target = "category.id", source = "categoryId")
    @Mapping(target = "subCategory.id", source = "subCategoryId")
    @Mapping(target = "id", ignore = true)
    Product tProduct(ProductRequest request);

    @Mapping(target = "categoryId", source = "category.id")
    @Mapping(target = "subCategoryId", source = "subCategory.id")
    ProductResponse tResponce(Product product);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "category", ignore = true)
    @Mapping(target = "subCategory", ignore = true)
    void updateProductFromRequest(ProductRequest productRequest, @MappingTarget Product product);

}
