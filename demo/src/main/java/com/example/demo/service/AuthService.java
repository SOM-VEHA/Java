package com.example.demo.service;
import com.example.demo.dto.request.UserRequest.LoginRequest;
import com.example.demo.dto.request.UserRequest.RegisterRequest;
import com.example.demo.dto.response.UserResponce.LoginResponce;
import com.example.demo.dto.response.UserResponce.RegisterResponce;
public interface AuthService {
    public RegisterResponce register(RegisterRequest registerRequest);
    public LoginResponce login(LoginRequest loginRequest);
}
