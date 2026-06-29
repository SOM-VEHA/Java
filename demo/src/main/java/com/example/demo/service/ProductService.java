package com.example.demo.service;


import com.example.demo.dto.request.ProductRequest;
import com.example.demo.dto.response.ProductResponce;
import java.util.List;
public interface ProductService {
    List<ProductResponce> getAll();
    ProductResponce getByid(Long id);
    ProductResponce create (ProductRequest productRequest);    
    ProductResponce update(ProductRequest productRequest,long id);
    void delete(Long id);
}