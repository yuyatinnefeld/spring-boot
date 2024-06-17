s## Setup and Start with Gradle

### Step 1: Build the Docker Image
First, you need to build the Docker image for the application. Make sure you are in the root directory of the project.

```bash
export IMAGE_NAME="yuyatinnefeld/spring-boot-gradle"
docker build -t $IMAGE_NAME . -f dockerfiles/dev.Dockerfile
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

### Step 5: Check the Test Results
![Springboot Test Results](/images/test-results.png)

```bash
docker cp $CONTAINER_ID:/app/tests/test test-results
```

## Use/Update Gradle

#### Run Gradle Container
```bash
export PORT=8080
export IMAGE_NAME=yuyatinnefeld/gradle
docker build -t $IMAGE_NAME . -f dockerfiles/gradle.Dockerfile
docker run -p $PORT:$PORT -d $IMAGE_NAME tail -f /dev/null
docker exec -it $CONTAINER_ID bash
```
#### Gradle Commands

```bash
# check gradle version
root@2171e3209db4:/app# gradle -v

# execute a customized task
root@2171e3209db4:/app# gradle task3

# install gradle wrapper to be able to use 'gradlew'
root@2171e3209db4:/app# gradle wrapper

# run test
root@2171e3209db4:/app# ./gradlew test

# run app
root@2171e3209db4:/app# ./gradlew clean build bootRun

# run test
root@2171e3209db4:/app# ./gradlew task2
```
##### Gradle Wrapper (gradlew)
`gradlew` is a script that allows you to run Gradle builds with a specific version of Gradle, ensuring consistency across different environments. It helps avoid issues related to different Gradle versions installed on different machines.

