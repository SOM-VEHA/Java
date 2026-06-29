package com.example.demo.dto.request.UserRequest;
import lombok.Data;
@Data
public class RegisterRequest {
    private String username;
    private String email;
    private String password;
}
