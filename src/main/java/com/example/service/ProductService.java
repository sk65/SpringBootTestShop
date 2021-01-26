package com.example.service;

import com.example.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ProductService {
    Page<Product> getProducts(Pageable pageable);

    Page<Product> getFilteredProducts(Pageable pageable, String filter);
}
