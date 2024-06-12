# STAGE 1 - BUILD ARTIFACTS WITH GRADLE
FROM gradle:7.5.1-jdk11 AS builder
WORKDIR /app
COPY build.gradle build.gradle
COPY settings.gradle settings.gradle
COPY src src
RUN gradle build --no-daemon