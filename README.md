# Hands-On Quick Learn - Java + Gradle + Spring Boot

## Overview
This project is a hands-on quick learning guide for setting up a Spring Boot application with Gradle and running it in a Docker container. The application includes a simple REST endpoint that returns a "Hello, World!" message.

## Requirements
- Docker

## Tech Stack
- Language: Java
- Build Tool: Gradle 
- Web App Framework: Spring Boot

## Setup and Start

### Step 1: Build the Docker Image
First, you need to build the Docker image for the application. Make sure you are in the root directory of the project.

```bash
export IMAGE_NAME="yuyatinnefeld/spring-boot"
docker build -t $IMAGE_NAME .
```

### Step 2: Run the Docker Container
Run the Docker container, mapping port 8080 (or any other port you prefer) on your host to port 8080 in the container.
```bash
export PORT=8080
docker run -it -p $PORT:$PORT $IMAGE_NAME
```

### Step 3: Access the Application
Open your web browser and navigate to http://localhost:8080. You should see the message "Hello, World!" displayed.

```bash
$ curl http://localhost:8080
Greetings from Spring Boot!
```

### Step 4: Access the Container Shell
```bash
docker ps

export CONTAINER_ID=<your_container_id>
docker exec -it $CONTAINER_ID bash
```