package com.safeher.safeher.controller;

import com.safeher.safeher.model.Alert;
import com.safeher.safeher.service.AlertService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/alerts")
public class AlertController {

    private final AlertService alertService;

    public AlertController(AlertService alertService) {
        this.alertService = alertService;
    }

    @PostMapping
    public ResponseEntity<Alert> createAlert(@AuthenticationPrincipal UserDetails userDetails, @RequestBody Map<String, Object> payload) {
        String userId = userDetails.getUsername(); // This is the Firebase UID
        double latitude = (Double) payload.get("latitude");
        double longitude = (Double) payload.get("longitude");
        String recordingUrl = (String) payload.get("recordingUrl");

        Alert alert = alertService.createAlert(userId, latitude, longitude, recordingUrl);
        return ResponseEntity.ok(alert);
    }

    @GetMapping
    public ResponseEntity<List<Alert>> getAlerts(@AuthenticationPrincipal UserDetails userDetails) {
        String userId = userDetails.getUsername();
        List<Alert> alerts = alertService.getAlertsByUserId(userId);
        return ResponseEntity.ok(alerts);
    }

    @PostMapping("/{id}/stop")
    public ResponseEntity<?> stopAlert(@PathVariable String id) {
        alertService.stopAlert(id);
        return ResponseEntity.ok().build();
    }
}
