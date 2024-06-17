# STAGE 1 - BUILD ARTIFACTS WITH GRADLE
FROM gradle:7.5.1-jdk11 AS builder
WORKDIR /code
COPY ./projects/gradle .
RUN gradle build --no-daemon --info