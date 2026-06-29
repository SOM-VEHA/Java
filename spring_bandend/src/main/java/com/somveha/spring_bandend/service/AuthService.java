package com.somveha.spring_bandend.service;

import java.util.List;

import com.somveha.spring_bandend.dto.request.UserRequest;
import com.somveha.spring_bandend.dto.response.UserResponse;

public interface AuthService {
    public List<UserResponse> getAll();
    public UserResponse register(UserRequest userRequest);
}
