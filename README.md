# SafeHer Backend

This is the backend for the SafeHer application, written in Java with Spring Boot.

## Prerequisites

- Java 17
- Maven
- Docker
- Docker Compose

## Setup Instructions

### 1. Environment Variables

Copy `.env.example` to `.env` and fill in your credentials:

```bash
cp .env.example .env
```

Required variables:
- `MONGODB_URI`: MongoDB connection string (default: mongodb://localhost:27017/safeher)
- `FCM_CREDENTIALS_PATH`: Path to Firebase service account JSON file
- `JWT_SECRET`: Secret key for JWT token generation
- `TWILIO_ACCOUNT_SID`: Twilio account SID (optional, for SMS alerts)
- `TWILIO_AUTH_TOKEN`: Twilio auth token (optional)
- `TWILIO_PHONE_NUMBER`: Twilio phone number (optional)

### 2. Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Go to Project Settings > Service Accounts
4. Click "Generate new private key"
5. Save the JSON file as `firebase-credentials.json` in the project root
6. Update `FCM_CREDENTIALS_PATH` in `.env` to point to this file

## Building and Running

### Locally

To run the application locally, you need to have a MongoDB instance running.

```bash
# Build the project
mvn clean install

# Run the application
java -jar target/safeher-0.0.1-SNAPSHOT.jar
```

### With Docker

To run the application with Docker, you can use the provided `docker-compose.yml` file.

```bash
# Build and run the containers
docker-compose up --build
```

## API Endpoints

A Postman collection with all the API endpoints will be provided.
