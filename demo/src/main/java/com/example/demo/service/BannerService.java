package com.example.demo.service;
import java.util.List;
import com.example.demo.dto.response.BannerResponse;
public interface BannerService {
    List<BannerResponse> getAll();
}
