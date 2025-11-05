package com.safeher.safeher.controller;

import com.safeher.safeher.model.Contact;
import com.safeher.safeher.model.User;
import com.safeher.safeher.repository.UserRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/contacts")
public class ContactController {

    private final UserRepository userRepository;

    public ContactController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PutMapping
    public ResponseEntity<?> updateContacts(@AuthenticationPrincipal UserDetails userDetails, @RequestBody List<Contact> contacts) {
        String firebaseUid = userDetails.getUsername();
        User user = userRepository.findByFirebaseUid(firebaseUid).orElse(null);
        if (user != null) {
            user.setContacts(contacts);
            userRepository.save(user);
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.status(404).body("User not found");
        }
    }
}
