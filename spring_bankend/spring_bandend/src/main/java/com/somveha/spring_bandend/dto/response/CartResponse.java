package com.somveha.spring_bandend.dto.response;

import java.util.List;

import lombok.Data;
@Data
public class CartResponse {
    private Long id;
    private Long userId;
    private List<CartItemResponse> items;
    private Double totalAmount;
}
