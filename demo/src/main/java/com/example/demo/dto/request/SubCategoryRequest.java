package com.example.demo.dto.request;

import lombok.Data;

@Data
public class SubCategoryRequest {
    private String title;

    private String description;

    private String image;

    private boolean status;

    private Long categoryId;
}
