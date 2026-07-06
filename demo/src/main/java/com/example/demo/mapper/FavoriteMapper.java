package com.example.demo.mapper;

import com.example.demo.dto.request.FavoriteRequest;
import com.example.demo.dto.response.FavoriteResponse;
import com.example.demo.entity.Favorite;

public interface FavoriteMapper {
    Favorite toEntity(FavoriteRequest favoriteRequest);
    FavoriteResponse toResponse(Favorite favorite);
}
