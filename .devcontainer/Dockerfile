# Start from official OpenJDK image (not dev containers)
FROM eclipse-temurin:17-jdk-jammy as builder

# Set working directory
WORKDIR /app

# Copy only what's needed
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

# Build the application
RUN ./mvnw package -Pprod -DskipTests

# Production stage
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

# JHipster-specific settings
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
