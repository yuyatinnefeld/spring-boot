# STAGE 1 - BUILD ARTIFACTS WITH MAVEN
FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR /code
COPY projects/maven/src src  
COPY projects/maven/pom.xml pom.xml  
#RUN mvn -X test
RUN mvn -f pom.xml clean package