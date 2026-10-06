FROM maven:3.8-eclipse-temurin-17 AS BUILD
WORKDIR /app
COPY . .

RUN mvn clean install -DskipTest
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=BUILD /app/target/*.jar /app/bff-agendador-tarefas.jar
EXPOSE 8083
CMD ["java", "-jar", "/app/bff-agendador-tarefas.jar"]