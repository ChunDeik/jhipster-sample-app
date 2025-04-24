# Use a minimal base image
FROM eclipse-temurin:17-jdk-alpine as runtime

# Set work directory inside container
WORKDIR /app

# Copy the built JAR file
COPY target/*.jar app.jar

# Expose the application port (optional, e.g., 8080)
EXPOSE 8080

# Set the startup command
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
