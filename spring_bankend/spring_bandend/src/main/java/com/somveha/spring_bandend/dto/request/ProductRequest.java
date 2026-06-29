package com.somveha.spring_bandend.dto.request;

import lombok.Data;

@Data
public class ProductRequest {
    private String name;
    private String description;
    private Double price;
    private Integer stock;
    private Long categoryId;
    private Long brandId;
}
