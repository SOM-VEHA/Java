package com.example.demo.dto.response;

import lombok.Data;

@Data
public class ProductResponce {
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
    // private String categoryName;

    private Long subCategoryId;
    // private String subCategoryName;
}
