package com.example.demo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.request.UserRequest.LoginRequest;
import com.example.demo.dto.request.UserRequest.RegisterRequest;
import com.example.demo.dto.response.UserResponce.LoginResponce;
import com.example.demo.dto.response.UserResponce.RegisterResponce;
import com.example.demo.service.AuthService;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/users")
public class AuthController {
    private final AuthService authService;
    @PostMapping("/login")
    public ResponseEntity<LoginResponce> login(@RequestBody LoginRequest loginRequest) {
        LoginResponce responce=authService.login(loginRequest);
        return ResponseEntity.ok(responce);
    }
    

    @PostMapping("/register")
    public ResponseEntity<RegisterResponce> create(@RequestBody RegisterRequest registerRequest) {
        RegisterResponce createUser = authService.register(registerRequest);
        return ResponseEntity.ok(createUser);
    }
}
