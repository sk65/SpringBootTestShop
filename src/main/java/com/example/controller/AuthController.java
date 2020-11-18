package com.example.controller;

import com.example.dto.CaptchaResponseDto;
import com.example.model.User;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

@Controller
public class AuthController {
    private static final String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";
    private final UserService userService;
    private final String secret;
    private final RestTemplate restTemplate;

    AuthController(UserService userservice, @Value("${recaptcha.secret}") String secret, RestTemplate restTemplate) {
        this.userService = userservice;
        this.secret = secret;
        this.restTemplate = restTemplate;
    }

    @GetMapping("/registration")
    public String registration() {
        return "/registration";
    }

    @PostMapping("/registration")
    public String addUser(@RequestParam("g-recaptcha-response") String captchaResponse,
                          @ModelAttribute @Valid User user,
                          BindingResult bindingResult,
                          Model model) {

        String url = String.format(CAPTCHA_URL, secret, captchaResponse);
        CaptchaResponseDto response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

        if (bindingResult.hasErrors() ||
                (user.getPassword() == null||user.getPassword().isEmpty()) ||
                (user.getPassword2() == null||user.getPassword2().isEmpty()) ||
                (user.getPassword() != null && !user.getPassword().equals(user.getPassword2())) ||
                !response.isSuccess()
        ) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            if (user.getPassword() == null||user.getPassword().isEmpty()) {
                model.addAttribute("passwordError", "Password cannot be empty!");
            }
            if (user.getPassword2() == null||user.getPassword2().isEmpty()) {
                model.addAttribute("password2Error", "Password confirmation cannot be empty!");
            }
            if (user.getPassword() != null && !user.getPassword().equals(user.getPassword2())) {
                model.addAttribute("confirmationError", "Passwords are not different");
            }
            if (!response.isSuccess()) {
                model.addAttribute("captchaError", "Fill captcha");
            }
            return "registration";
        }

        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "User exists");
            return "registration";
        }
        return "notification";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activeUser(code);
        if (isActivated) {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Activation code is not found!");
        }
        return "login";
    }

    @GetMapping("/login")
    public String login(@RequestParam(name = "error", required = false) String error, Model model) {
        if (error != null) {
            model.addAttribute("error", true);
        }
        return "login";
    }

    @GetMapping("/accessDenied")
    public String accessDenied() {
        return "accessDenied";
    }
}
