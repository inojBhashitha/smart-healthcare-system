package com.smarthealthcare.backend.user.controller;

import com.smarthealthcare.backend.user.entity.User;
import com.smarthealthcare.backend.user.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/api/users")
    public List<User> getUsers() {
        return userService.getAllUsers();
    }
}