package com.example.demo.dto.response;
import lombok.Data;
@Data
public class CategoryResponse {
    private Long id;
    private String title;
    private String description;
    private String image;
    private boolean status;
}
