package com.example.demo.mapper;
import com.example.demo.dto.request.LoginRequest;
import com.example.demo.dto.response.LoginResponce;

public interface userMapper {
    public LoginResponce rLoginResponce(LoginRequest loginRequest);
}
