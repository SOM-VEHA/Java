package com.somveha.spring_bandend.dto.request;

import lombok.Data;

@Data
public class OrderRequest {
    private Long addressId;
    private String paymentMethod;
}
