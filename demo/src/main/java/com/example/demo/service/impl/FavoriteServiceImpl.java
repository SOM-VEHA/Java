package com.example.demo.service.impl;
import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.dto.request.FavoriteRequest;
import com.example.demo.dto.response.FavoriteResponse;
import com.example.demo.dto.response.ProductResponse;
import com.example.demo.entity.Favorite;
import com.example.demo.entity.Product;
import com.example.demo.entity.User;
import com.example.demo.mapper.FavoriteMapper;
import com.example.demo.repository.AuthRepository;
import com.example.demo.repository.FavoriteRepository;
import com.example.demo.service.FavoriteService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class FavoriteServiceImpl implements FavoriteService {
    private final FavoriteRepository favoriteRepository;
    // private final FavoriteMapper favoriteMapper;
    private final AuthRepository userRepository;

    @Override
    public List<ProductResponse> getFavorites(String email) {

        User user = userRepository.findByEmail(email).orElseThrow(() -> new RuntimeException("User not found"));

        List<Favorite> favorites = favoriteRepository.findByUser(user);



        return favorites.stream()
                .map(favorite -> {

                    Product product = favorite.getProduct();

                    ProductResponse response = new ProductResponse();
                    response.setId(product.getId());
                    response.setTitle(product.getTitle());
                    response.setDescription(product.getDescription());
                    response.setImage_url(product.getImage_url());
                    response.setPrice(product.getPrice());
                    response.setOriginalPrice(product.getOriginalPrice());
                    response.setRating(product.getRating());
                    response.setReviewsCount(product.getReviewsCount());
                    response.setSalesCount(product.getSalesCount());
                    response.setStock(product.getStock());
                    response.setFreeShipping(product.isFreeShipping());
                    response.setStatus(product.isStatus());

                    return response;
                })
                .toList();
    }
}
