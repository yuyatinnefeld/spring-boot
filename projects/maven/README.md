# Setup and Start with Maven

### Step 1: Build the Docker Image
First, you need to build the Docker image for the application. Make sure you are in the root directory of the project.

```bash
export IMAGE_NAME="yuyatinnefeld/spring-boot-maven"
docker build -t $IMAGE_NAME . -f dockerfiles/spring.maven.Dockerfile
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

$ curl http://localhost:8080/build
Build with Maven
```

### Step 4: Access the Container Shell
```bash
docker ps

export CONTAINER_ID=<your_container_id>
docker exec -it $CONTAINER_ID bash
```

## Use/Update Maven

#### Run Maven Container
```bash
export PORT=8080
export IMAGE_NAME="yuyatinnefeld/maven"
docker build -t $IMAGE_NAME . -f dockerfiles/maven.Dockerfile
docker run -p $PORT:$PORT -d $IMAGE_NAME tail -f /dev/null
docker exec -it $CONTAINER_ID bash
```
#### Maven Commands

```bash
# check maven version
root@2171e3209db4:/app# mvn -v

# execute tests
root@2171e3209db4:/app# mvn test -X

# validate the project is correct
mvn validate

# build a project (target dir will be created)
mvn compile

# delete a project (target dir will be deleted)
mvn clean

# build and pacakge the project (JAR file - e.g. dev-0.0.1-SNAPSHOT.jar will be createdr created)
mvn package

# run the spring boot application
mvn spring-boot:run
```

