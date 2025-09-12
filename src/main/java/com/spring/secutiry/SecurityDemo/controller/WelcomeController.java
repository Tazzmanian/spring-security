package com.spring.secutiry.SecurityDemo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public record WelcomeController() {

    @GetMapping("/welcome")
    public String welcome() {
        return "welcome";
    }
}
