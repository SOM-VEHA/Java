package com.example.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
        @Bean
        public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
                return http
                                .csrf(csrf -> csrf.disable())
                                .authorizeHttpRequests(auth -> auth

                                                // Most specific first
                                                .requestMatchers("/api/users/login", "/api/users/register").permitAll()
                                                .requestMatchers("/api/categories/**").permitAll()
                                                .requestMatchers("/api/products/**").permitAll() // ← This line
                                                .requestMatchers("/api/banner").permitAll()
                                                .requestMatchers("/api/subcategories/**").permitAll()
                                                .anyRequest().authenticated())
                                .build();
        }

        @Bean
        public PasswordEncoder passwordEncoder() {
                return new BCryptPasswordEncoder();
        }
}
