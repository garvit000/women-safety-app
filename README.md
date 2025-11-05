# SafeHer Backend

This is the backend for the SafeHer application, written in Java with Spring Boot.

## Prerequisites

- Java 17
- Maven
- Docker
- Docker Compose

## Environment Variables

Create a `.env` file in the root of the project with the following variables:

```
MONGO_URI=mongodb://localhost:27017/safeher
JWT_SECRET=your-jwt-secret
TWILIO_SID=your-twilio-sid
TWILIO_TOKEN=your-twilio-token
TWILIO_PHONE_NUMBER=your-twilio-phone-number
FCM_CREDENTIALS_PATH=your-fcm-credentials-path
```

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
