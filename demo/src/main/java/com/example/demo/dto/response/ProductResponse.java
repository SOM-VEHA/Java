package com.example.demo.dto.response;

import lombok.Data;

@Data
public class ProductResponse {
    private Long id;
    private String title;
    private String description;
    private String image_url;
    private boolean status;
    private Long stock;
    private boolean freeShipping;
    private int salesCount;
    private int reviewsCount;
    private double rating;
    private double originalPrice;
    private double price;
    private Long categoryId;
    private Long subCategoryId;
}
