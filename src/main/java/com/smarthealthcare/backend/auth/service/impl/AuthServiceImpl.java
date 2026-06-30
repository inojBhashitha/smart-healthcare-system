package com.smarthealthcare.backend.auth.service.impl;

import com.smarthealthcare.backend.auth.service.AuthService;
import com.smarthealthcare.backend.dto.auth.AuthResponse;
import com.smarthealthcare.backend.dto.auth.RegisterRequest;
import com.smarthealthcare.backend.entity.User;
import com.smarthealthcare.backend.exception.ResourceAlreadyExistsException;
import com.smarthealthcare.backend.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements AuthService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public AuthServiceImpl(UserRepository userRepository,
                           PasswordEncoder passwordEncoder) {

        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public AuthResponse register(RegisterRequest request) {

        User user = new User();

        user.setName(request.getName());
        user.setEmail(request.getEmail());

        // Encrypt password
        user.setPassword(passwordEncoder.encode(request.getPassword()));

        user.setRole(request.getRole());
        user.setEnabled(true);

        if (userRepository.existsByEmail(request.getEmail())) {
    throw new ResourceAlreadyExistsException("Email already registered");
}

        userRepository.save(user);

        return new AuthResponse(
                "",
                "User registered successfully"
        );
    }

}