package com.safeher.safeher.service;

import com.safeher.safeher.model.Alert;
import com.safeher.safeher.model.Contact;
import com.safeher.safeher.model.User;
import com.safeher.safeher.repository.AlertRepository;
import com.safeher.safeher.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class AlertService {

    private final AlertRepository alertRepository;
    private final UserRepository userRepository;
    private final TwilioService twilioService;
    private final FCMService fcmService;

    public AlertService(AlertRepository alertRepository, UserRepository userRepository, TwilioService twilioService, FCMService fcmService) {
        this.alertRepository = alertRepository;
        this.userRepository = userRepository;
        this.twilioService = twilioService;
        this.fcmService = fcmService;
    }

    public Alert createAlert(String userId, double latitude, double longitude, String recordingUrl) {
        Alert alert = new Alert();
        alert.setUserId(userId);
        alert.setLatitude(latitude);
        alert.setLongitude(longitude);
        alert.setTimestamp(LocalDateTime.now());
        alert.setRecordingUrl(recordingUrl);

        Alert savedAlert = alertRepository.save(alert);

        // Send notifications
        sendNotifications(savedAlert);

        return savedAlert;
    }

    private void sendNotifications(Alert alert) {
        User user = userRepository.findById(alert.getUserId()).orElse(null);
        if (user != null && user.getContacts() != null) {
            String message = "Emergency alert from " + user.getName() + ". Location: https://maps.google.com/?q=" + alert.getLatitude() + "," + alert.getLongitude();
            for (Contact contact : user.getContacts()) {
                // Send SMS
                twilioService.sendSms(contact.getPhoneNumber(), message);

                // Send push notification if the contact has the app
                // This requires getting the contact's user object and their FCM token
            }
        }
    }

    public List<Alert> getAlertsByUserId(String userId) {
        return alertRepository.findByUserId(userId);
    }

    public void stopAlert(String alertId) {
        // Logic to stop the alert
    }
}
