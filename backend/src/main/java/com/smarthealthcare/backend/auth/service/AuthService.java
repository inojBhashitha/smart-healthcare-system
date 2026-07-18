package com.smarthealthcare.backend.auth.service;

import com.smarthealthcare.backend.auth.dto.AuthResponse;
import com.smarthealthcare.backend.auth.dto.LoginRequest;
import com.smarthealthcare.backend.auth.dto.RegisterRequest;

public interface AuthService {

    AuthResponse register(RegisterRequest request);

    AuthResponse login(LoginRequest request);

}