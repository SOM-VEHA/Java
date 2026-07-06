// package com.example.demo.controller;

// import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
// import org.springframework.http.ResponseEntity;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RestController;

// import com.example.demo.service.FavoriteService;

// import lombok.RequiredArgsConstructor;

// @RestController
// @RequestMapping("/api/favorites")
// @RequiredArgsConstructor
// public class FavoriteController {
//     final FavoriteService favoriteService;
//     @GetMapping
//     public ResponseEntity<?> getFavorites(Authentication authentication) {
//         String email = authentication.getName();
//         return ResponseEntity.ok(favoriteService.getFavorites(email));
//     }
// }
