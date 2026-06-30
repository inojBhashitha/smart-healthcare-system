package com.smarthealthcare.backend.auth.service;

import com.smarthealthcare.backend.dto.auth.AuthResponse;
import com.smarthealthcare.backend.dto.auth.LoginRequest;
import com.smarthealthcare.backend.dto.auth.RegisterRequest;

public interface AuthService {

    AuthResponse register(RegisterRequest request);

    AuthResponse login(LoginRequest request);

}