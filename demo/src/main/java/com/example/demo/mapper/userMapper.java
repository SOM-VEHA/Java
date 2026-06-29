package com.example.demo.mapper;

import com.example.demo.dto.request.UserRequest.LoginRequest;
import com.example.demo.dto.response.UserResponce.LoginResponce;

public interface userMapper {
    public LoginResponce rLoginResponce(LoginRequest loginRequest);
}
