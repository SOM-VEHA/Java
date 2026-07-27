package com.example.demo.service;


import com.example.demo.dto.request.ProductRequest;
import com.example.demo.dto.response.ProductResponse;
import java.util.List;
public interface ProductService {
    List<ProductResponse> getAll();
    ProductResponse getByid(Long id);
    ProductResponse create (ProductRequest productRequest);    
    ProductResponse update(ProductRequest productRequest,Long id);
    void delete(Long id);
}