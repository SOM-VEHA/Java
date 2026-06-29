package com.example.demo.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.domain.Product;
import com.example.demo.dto.request.ProductRequest;
import com.example.demo.dto.response.ProductResponce;
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
    public ProductResponce create(ProductRequest productRequest) {
        Product products = productMapper.tProduct(productRequest);
        Product saveProduct = productRepository.save(products);
        ProductResponce productResponce = productMapper.tResponce(saveProduct);
        return productResponce;
    }

    @Override
    public List<ProductResponce> getAll() {
        List<Product> product = productRepository.findAll();
        List<ProductResponce> productResponces = product.stream().map(productMapper::tResponce).toList();
        return productResponces;
    }

    @Override
    public ProductResponce update(ProductRequest productRequest, long id) {
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
    public ProductResponce getByid(Long id) {
        Product product = productRepository.findById(id) .orElseThrow(() -> new RuntimeException("Product not found with id: " + id));
        ProductResponce productResponce=productMapper.tResponce(product);
        return productResponce;
    }

}
