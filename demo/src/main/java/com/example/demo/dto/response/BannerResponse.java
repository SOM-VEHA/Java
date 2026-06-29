package com.example.demo.dto.response;

import lombok.Data;

@Data
public class BannerResponse {
        private Long id;

    private String title;

    private String imageUrl;

    private String description;

    private Boolean status;

    private Integer position;
}
