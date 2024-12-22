# Use a minimal base image with OpenJDK 8
FROM openjdk:8-jdk-alpine

# Create a non-root user and set permissions
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# Define build argument for dependencies
ARG DEPENDENCY=target/dependency

# Copy application dependencies and classes
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

# Set the entry point for the application
ENTRYPOINT ["java", "-cp", "app:app/lib/*", "ie.ucd.ibot.MyApplication"]
