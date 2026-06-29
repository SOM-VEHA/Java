package com.somveha.spring_bandend.dto;

import lombok.Data;

@Data
public class ApiResponse<T> {
    private Boolean success;
    private String message;
    private T data;
}
