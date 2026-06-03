FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

COPY net/pom.xml ./
COPY net/src/ ./src/
COPY net/mvnw ./
COPY net/.mvn ./.mvn

RUN mvn clean package -DskipTests


FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/net-*.war app.war

EXPOSE 8000

CMD ["java", "-jar", "app.war"]
