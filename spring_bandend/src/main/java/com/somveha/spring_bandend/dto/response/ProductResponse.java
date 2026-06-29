package com.somveha.spring_bandend.dto.response;

import lombok.Data;

@Data
public class ProductResponse {
    private Long id;
    private String name;
    private String description;
    private Double price;
    private Integer stock;
    private String imageUrl;
    private Boolean active;
    private CategoryResponse category;
    private BrandResponse brand;
}