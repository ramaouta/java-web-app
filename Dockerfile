FROM adoptopenjdk/openjdk11:alpine-slim as build
WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN ./mvnw package -DskipTests
ARG PORT=8100
FROM adoptopenjdk/openjdk11:alpine-slim
WORKDIR /workspace/app/target
ENTRYPOINT ["java","-jar","com.example.demo.DemoApplication"]
EXPOSE $PORT
