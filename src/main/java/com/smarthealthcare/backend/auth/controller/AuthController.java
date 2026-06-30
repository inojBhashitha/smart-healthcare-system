package com.smarthealthcare.backend.auth.controller;

import com.smarthealthcare.backend.auth.service.AuthService;
import com.smarthealthcare.backend.dto.auth.AuthResponse;
import com.smarthealthcare.backend.dto.auth.LoginRequest;
import com.smarthealthcare.backend.dto.auth.RegisterRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;
import com.smarthealthcare.backend.dto.auth.LoginRequest;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(
            @Valid @RequestBody RegisterRequest request) {

        AuthResponse response = authService.register(request);

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(response);
    }

    @PostMapping("/login")
public ResponseEntity<AuthResponse> login(
        @Valid @RequestBody LoginRequest request) {

    AuthResponse response = authService.login(request);

    return ResponseEntity.ok(response);
}
}