package com.example.demo.service;
import java.util.List;

import com.example.demo.dto.request.FavoriteRequest;
import com.example.demo.dto.response.FavoriteResponse;
import com.example.demo.entity.Product;

public interface FavoriteService {

    FavoriteResponse addFavorite(FavoriteRequest favoriteRequest);

    void removeFavorite(FavoriteRequest favoriteRequest);

    List<Product> getFavorites(Long userId);
}
