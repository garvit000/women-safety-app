package com.safeher.safeher.controller;

import com.google.firebase.auth.FirebaseAuthException;
import com.safeher.safeher.service.AuthService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> payload) {
        try {
            String token = authService.login(payload.get("token"));
            return ResponseEntity.ok(Map.of("token", token));
        } catch (FirebaseAuthException e) {
            return ResponseEntity.status(401).body("Invalid Firebase token");
        }
    }

    // You would also have a /register endpoint here
}
