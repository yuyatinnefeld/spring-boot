# STAGE 1 - BUILD ARTIFACTS WITH GRADLE
FROM gradle:7.5.1-jdk11 AS builder
WORKDIR /app
COPY ./gradle/build.gradle build.gradle
COPY ./gradle/settings.gradle settings.gradle
COPY ./gradle/gradle.properties gradle.properties
COPY ./src src
RUN gradle build --no-daemon

# STAGE 2 - RUN SPRING BOOT APP
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/build/libs/my-spring-boot-app-1.0.0.jar app.jar
COPY --from=builder /app/build/reports/tests tests
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
