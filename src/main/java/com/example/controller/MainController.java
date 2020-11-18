package com.example.controller;

import com.example.model.Product;
import com.example.service.ProductService;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MainController {

    private final ProductService productService;

    @Autowired
    MainController(ProductService productService, UserService userService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String main(@RequestParam(required = false) String filter, Model model) {
        List<Product> products;
        if (filter != null && !filter.isEmpty()) {
            products = productService.getFilteredProducts(filter);
        } else {
            products = productService.getProducts();
        }
        model.addAttribute("products", products);
        return "/main";
    }

}
