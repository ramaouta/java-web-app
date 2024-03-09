FROM  eclipse-temurin:11-jdk
WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN mvn package -DskipTests
ARG PORT=8180
WORKDIR /workspace/app/target
ENTRYPOINT ["java","-jar","demo-0.0.1-SNAPSHOT.jar"]
EXPOSE $PORT
