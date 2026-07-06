package com.example.demo.service.impl;

import java.util.List;

import com.example.demo.dto.request.FavoriteRequest;
import com.example.demo.dto.response.FavoriteResponse;
import com.example.demo.entity.Favorite;
import com.example.demo.entity.Product;
import com.example.demo.mapper.FavoriteMapper;
import com.example.demo.repository.FavoriteRepository;
import com.example.demo.service.FavoriteService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class FavoriteServiceImpl implements FavoriteService {
    private final FavoriteRepository favoriteRepository;
    private final FavoriteMapper favoriteMapper;

    @Override
    public List<Product> getFavorites(Long userId) {
        
        return null;
    }

    @Override
    public FavoriteResponse addFavorite(FavoriteRequest favoriteRequest) {
        if (!favoriteRepository.existsByUserIdAndProductId(favoriteRequest.getUserId(),
                favoriteRequest.getProductId())) {
            Favorite favorite = favoriteMapper.toEntity(favoriteRequest);
            Favorite savedFavorite = favoriteRepository.save(favorite);
            return favoriteMapper.toResponse(savedFavorite);
        } else {
            return null;
        }

    }

    @Override
    public void removeFavorite(FavoriteRequest favoriteRequest) {
        favoriteRepository.deleteByUserIdAndProductId(favoriteRequest.getUserId(), favoriteRequest.getProductId());
    }
}
