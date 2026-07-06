package com.example.demo.dto.response;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.example.demo.dto.request.BannerRequest;
import com.example.demo.entity.Banner;

@Mapper(componentModel = "spring")
public interface BannerMapper {
    @Mapping(target = "id", ignore = true)
    Banner tBanner(BannerRequest bannerRequest);
    BannerResponse tResponse(Banner banner);
}
