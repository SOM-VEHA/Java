package com.example.demo.service.impl;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.JwtService;
import com.example.demo.domain.User;
import com.example.demo.dto.request.UserRequest.LoginRequest;
import com.example.demo.dto.request.UserRequest.RegisterRequest;
import com.example.demo.dto.response.UserResponce.LoginResponce;
import com.example.demo.dto.response.UserResponce.RegisterResponce;
import com.example.demo.repository.AuthRepository;
import com.example.demo.service.AuthService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {
    private final AuthRepository authRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    @Override
    public RegisterResponce register(RegisterRequest registerRequest) {
        User user = new User();
        user.setUsername(registerRequest.getUsername());
        user.setEmail(registerRequest.getEmail());
        user.setPassword(passwordEncoder.encode(registerRequest.getPassword()));
        User saveUser = authRepository.save(user);
        RegisterResponce response = new RegisterResponce();
        response.setId(saveUser.getId());
        response.setUsername(saveUser.getUsername());
        response.setEmail(saveUser.getEmail());
        return response;
    }

    @Override
    public LoginResponce login(LoginRequest loginRequest) {
        User user = authRepository.findByEmail(loginRequest.getEmail()).orElseThrow(() -> new RuntimeException("User not Found"));
        if (!passwordEncoder.matches(loginRequest.getPassword(), user.getPassword())) {
            throw new RuntimeException("Invalid password");
        } else {
            String token = jwtService.generateToken(user.getEmail());
            LoginResponce response = new LoginResponce();
            response.setId(user.getId());
            response.setUsername(user.getUsername());
            response.setEmail(user.getEmail());
            response.setToken(token);
            return response;
        }
    }
}
