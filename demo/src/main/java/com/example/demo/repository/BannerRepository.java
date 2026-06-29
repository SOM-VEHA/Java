package com.example.demo.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.domain.Banner;
public interface BannerRepository extends JpaRepository<Banner, Long> {

}
