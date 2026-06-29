package com.example.demo.dto.response.RoleResponce;
import lombok.Data;
@Data
public class ApiResponse<T> {
    private boolean success;
    private String message;
    private T data;
}
