package com.example.demo.dto.request;
import lombok.Data;
@Data
public class CategoryRequest {
    private String title;
    private String description;
    private String image;
    private boolean status;
}
