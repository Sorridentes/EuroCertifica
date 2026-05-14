FROM maven:3.9.8-eclipse-temurin-17 AS builder
WORKDIR /workspace

COPY pom.xml .
COPY ../.env ./.env
RUN mvn -B -DskipTests dependency:go-offline

COPY src ./src
RUN mvn -B package -DskipTests

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

COPY --from=builder /workspace/target/backend-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
