package com.safeher.safeher.service;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import com.safeher.safeher.model.User;
import com.safeher.safeher.repository.UserRepository;
import com.safeher.safeher.security.JwtTokenUtil;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AuthService implements UserDetailsService {

    private final UserRepository userRepository;
    private final JwtTokenUtil jwtTokenUtil;

    public AuthService(UserRepository userRepository, JwtTokenUtil jwtTokenUtil) {
        this.userRepository = userRepository;
        this.jwtTokenUtil = jwtTokenUtil;
    }

    public String login(String firebaseToken) throws FirebaseAuthException {
        FirebaseToken decodedToken = FirebaseAuth.getInstance().verifyIdToken(firebaseToken);
        String uid = decodedToken.getUid();

        // You might want to create a user in your database here if they don't exist
        userRepository.findByFirebaseUid(uid).orElseGet(() -> {
            User newUser = new User();
            newUser.setFirebaseUid(uid);
            newUser.setName(decodedToken.getName());
            try {
                newUser.setPhoneNumber(FirebaseAuth.getInstance().getUser(uid).getPhoneNumber());
            } catch (FirebaseAuthException e) {
                throw new RuntimeException(e);
            }
            return userRepository.save(newUser);
        });

        final UserDetails userDetails = loadUserByUsername(uid);
        return jwtTokenUtil.generateToken(userDetails);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByFirebaseUid(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found with firebase uid: " + username));
        return new org.springframework.security.core.userdetails.User(user.getFirebaseUid(), "", new ArrayList<>());
    }
}
