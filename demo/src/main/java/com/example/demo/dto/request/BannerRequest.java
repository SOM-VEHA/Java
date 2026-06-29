package com.example.demo.dto.request;

import lombok.Data;

@Data
public class BannerRequest {
    private String title;

    private String imageUrl;

    private String description;

    private Boolean status;

    private Integer position;
}
