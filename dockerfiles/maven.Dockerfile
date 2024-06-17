# STAGE 1 - BUILD ARTIFACTS WITH MAVEN
FROM maven:3.6.0-jdk-11-slim AS build
COPY apps/app2/src /usr/src/app/src  
COPY maven/pom.xml /usr/src/app  
RUN mvn -f /usr/src/app/pom.xml clean package

# STAGE 2 - RUN SPRING BOOT APP
FROM openjdk:11-jre-slim 
COPY --from=build /usr/src/app/target/demo-0.0.1-SNAPSHOT.jar /usr/app/demo-0.0.1-SNAPSHOT.jar  
EXPOSE 8080  
CMD ["java","-jar","/usr/app/demo-0.0.1-SNAPSHOT.jar"]