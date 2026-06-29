package com.example.demo.dto.response;

import lombok.Data;

@Data
public class SubCategoryResponse {
    private Long id;

    private String title;

    private String description;

    private String image;

    private boolean status;

    private Long categoryId;

    private String categoryName;
}
