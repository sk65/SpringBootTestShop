package com.example.service;

import com.example.model.Product;

import java.util.List;
import java.util.Optional;

public interface ProductService {
    List<Product> getProducts();

    List<Product> getFilteredProducts(String filter);
}
