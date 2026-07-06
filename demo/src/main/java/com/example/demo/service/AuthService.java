package com.example.demo.service;
import com.example.demo.dto.request.LoginRequest;
import com.example.demo.dto.request.RegisterRequest;
import com.example.demo.dto.response.LoginResponce;
import com.example.demo.dto.response.RegisterResponce;
public interface AuthService {
    public RegisterResponce register(RegisterRequest registerRequest);
    public LoginResponce login(LoginRequest loginRequest);
}
