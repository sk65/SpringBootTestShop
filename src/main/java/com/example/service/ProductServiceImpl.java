package com.example.service;

import com.example.model.Product;
import com.example.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
    private final ProductRepository productRepository;

    @Autowired
    public ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }


    @Override
    public Page<Product> getProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    @Override
    public Page<Product> getFilteredProducts(Pageable pageable, String filter) {
        return productRepository.findByNameIgnoreCase(pageable, filter.trim());
    }


}
