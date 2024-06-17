# STAGE 1 - BUILD ARTIFACTS WITH MAVEN
FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR /code
COPY projects/maven/src src  
COPY projects/maven/pom.xml pom.xml  
#RUN mvn -X test
RUN mvn -f pom.xml clean package

# STAGE 2 - RUN SPRING BOOT APP
FROM openjdk:11-jre-slim 
WORKDIR /code
COPY --from=build code/target/dev-0.0.1-SNAPSHOT.jar dev-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java","-jar","dev-0.0.1-SNAPSHOT.jar"]