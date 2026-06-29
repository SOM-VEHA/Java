package com.example.demo.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.domain.Banner;
import com.example.demo.dto.response.BannerMapper;
import com.example.demo.dto.response.BannerResponse;
import com.example.demo.repository.BannerRepository;
import com.example.demo.service.BannerService;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Service
public class BannerServiceImpl implements BannerService{
    private final BannerRepository bannerRepository;
    private final BannerMapper bannerMapper;
    @Override
    public List<BannerResponse> getAll() {
        List<Banner> banners=bannerRepository.findAll();
        List<BannerResponse> bannerResponses=banners.stream().map(bannerMapper::tResponse).toList();
        return bannerResponses;
    }

}
