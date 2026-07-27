package com.example.demo.service;
import java.util.List;

import org.springframework.boot.autoconfigure.couchbase.CouchbaseProperties.Authentication;

import com.example.demo.dto.request.FavoriteRequest;
import com.example.demo.dto.response.FavoriteResponse;
import com.example.demo.dto.response.ProductResponse;
import com.example.demo.entity.Product;

public interface FavoriteService {

    List<ProductResponse> getFavorites(String email);

    // FavoriteResponse addFavorite(FavoriteRequest favoriteRequest);

    // void removeFavorite(FavoriteRequest favoriteRequest);

    // List<Product> getFavorites(Long userId);

    // List<ProductResponse> getFavoriteProductsByUserId(Authentication authentication);
}
