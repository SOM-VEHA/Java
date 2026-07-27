package com.example.demo.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;

import com.example.demo.dto.request.ProductRequest;
import com.example.demo.dto.response.ProductResponse;
import com.example.demo.entity.Product;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.repository.ProductRepository;
import com.example.demo.service.ProductService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {
    private final ProductRepository productRepository;
    private final ProductMapper productMapper;

    @Override
    public ProductResponse create(ProductRequest productRequest) {
        Product products = productMapper.tProduct(productRequest);
        Product saveProduct = productRepository.save(products);
        ProductResponse productResponce = productMapper.tResponce(saveProduct);
        return productResponce;
    }

    @Override
    public List<ProductResponse> getAll() {
        List<Product> product = productRepository.findAll();
        List<ProductResponse> productResponces = product.stream().map(productMapper::tResponce).toList();
        return productResponces;
    }

    @Override
    public ProductResponse update(ProductRequest productRequest, Long id) {
        Product product = productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product not found with id: " + id));
        Product savedProduct = productRepository.save(product);
        productMapper.updateProductFromRequest(productRequest, product);
        return productMapper.tResponce(savedProduct);
    }

    @Override
    public void delete(Long id) {
        productRepository.deleteById(id);
    }

    @Override
    public ProductResponse getByid(Long id) {
        Product product = productRepository.findById(id) .orElseThrow(() -> new RuntimeException("Product not found with id: " + id));
        ProductResponse productResponce=productMapper.tResponce(product);
        return productResponce;
    }

}
