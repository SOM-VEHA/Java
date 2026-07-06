package com.example.demo.dto.response;

import lombok.Data;

@Data
public class FavoriteResponse {
    private Long id;
    private Long userId;
    private Long productId;
}
