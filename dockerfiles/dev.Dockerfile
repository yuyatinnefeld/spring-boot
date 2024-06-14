# STAGE 1 - BUILD ARTIFACTS WITH GRADLE
FROM gradle:7.5.1-jdk11 AS builder
WORKDIR /code
COPY ./gradle gradle
COPY ./apps/app1/src src
COPY gradle.properties gradle.properties
COPY settings.gradle settings.gradle
COPY build.gradle build.gradle
RUN gradle build --no-daemon

# STAGE 2 - RUN SPRING BOOT APP
FROM openjdk:11-jre-slim
WORKDIR /code
COPY --from=builder /code/build/libs/my-spring-boot-app-1.0.0.jar app.jar
COPY --from=builder /code/build/reports/tests tests
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
