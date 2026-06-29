package com.somveha.spring_bandend.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.somveha.spring_bandend.dto.request.UserRequest;
import com.somveha.spring_bandend.dto.response.UserResponse;
import com.somveha.spring_bandend.service.AuthService;

import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RequiredArgsConstructor
@RestController
@RequestMapping("/api/users")
public class UserController {
    private final AuthService authService;
    @PostMapping
    public ResponseEntity<?> create(@RequestBody UserRequest userRequest) {
        UserResponse userResponse=authService.register(userRequest);
        return ResponseEntity.ok(userResponse);
    }
    @GetMapping
    public ResponseEntity<List<UserResponse>> getAll() {
        List<UserResponse> userResponses=authService.getAll();
        return ResponseEntity.ok(userResponses); 
    }
    
}
