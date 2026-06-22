package com.smarthealthcare.backend.controller;

import com.smarthealthcare.backend.entity.User;
import com.smarthealthcare.backend.repository.UserRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {

    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/api/users")
    public List<User> getUsers() {
        return userRepository.findAll();
    }
}