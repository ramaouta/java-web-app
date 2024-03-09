FROM adoptopenjdk/openjdk11:alpine-slim as build
WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN ./mvnw package -DskipTests
ARG PORT=8180
FROM adoptopenjdk/openjdk11:alpine-slim
WORKDIR /workspace/app/target
ENTRYPOINT ["java","-jar","demo-0.0.1-SNAPSHOT.jar"]
EXPOSE $PORT
