# SafeHer Frontend

This is the frontend for the SafeHer application, built with Flutter.

## Prerequisites

- Flutter SDK
- An editor like VS Code or Android Studio
- An emulator or a physical device

## Getting Started

1. **Install dependencies:**

   ```bash
   flutter pub get
   ```

2. **Generate Hive type adapters:**

   ```bash
   flutter pub run build_runner build
   ```

3. **Run the app:**

   ```bash
   flutter run
   ```

## Firebase Setup

1. Create a new Firebase project.
2. Enable Firebase Authentication with the Phone Number sign-in provider.
3. Add an Android and/or iOS app to your Firebase project.
4. Download the `google-services.json` file for Android and/or the `GoogleService-Info.plist` file for iOS.
5. Place the `google-services.json` file in the `android/app` directory.
6. Place the `GoogleService-Info.plist` file in the `ios/Runner` directory.

## Permissions

You will need to add the following permissions to your `AndroidManifest.xml` (for Android) and `Info.plist` (for iOS) files:

- Location (background and foreground)
- Microphone
- Camera
- Contacts
