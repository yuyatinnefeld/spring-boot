# STAGE 1 - BUILD ARTIFACTS WITH GRADLE
FROM gradle:7.5.1-jdk11 AS builder
WORKDIR /app
COPY build.gradle build.gradle
COPY settings.gradle settings.gradle
COPY src src
RUN gradle build --no-daemon

# STAGE 2 - RUN SPRING BOOT APP
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/build/libs/my-spring-boot-app-0.1.1.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
