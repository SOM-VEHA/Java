package com.example.demo.dto.response;

import lombok.Data;

@Data
public class LoginResponce {
    private Long id;
    private String username;
    private String email;
    private String token;
}
