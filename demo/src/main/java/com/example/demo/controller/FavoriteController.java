package com.example.demo.controller;
import java.util.List;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.dto.response.ProductResponse;
import com.example.demo.service.FavoriteService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/favorites")
@RequiredArgsConstructor
public class FavoriteController {
    final FavoriteService favoriteService;

    @GetMapping
    public List<ProductResponse> getFavorites(Authentication authentication) {
        return favoriteService.getFavorites(authentication.getName());
    }
}
