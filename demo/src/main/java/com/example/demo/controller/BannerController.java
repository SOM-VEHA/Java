package com.example.demo.controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.dto.response.BannerResponse;
import com.example.demo.service.BannerService;
import lombok.RequiredArgsConstructor;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/banner")
public class BannerController {
    private final BannerService bannerService;
    @GetMapping
    public ResponseEntity<List<BannerResponse>> getMethodName() {
        List<BannerResponse> bannerResponses=bannerService.getAll();
        return ResponseEntity.ok(bannerResponses);
    }
}
