package com.example.controller;

import com.example.model.Product;
import com.example.service.ProductService;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MainController {

    private final ProductService productService;

    @Autowired
    MainController(ProductService productService, UserService userService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String main(@RequestParam(required = false) String filter,
                       Model model,
                       @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Product> page;
        if (filter != null && !filter.isEmpty()) {
            page = productService.getFilteredProducts(pageable, filter);
        } else {
            page = productService.getProducts(pageable);
        }
        model.addAttribute("page", page);
        model.addAttribute("url", "/test");
        return "/main";
    }

}
