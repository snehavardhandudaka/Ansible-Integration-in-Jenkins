FROM openjdk:17-jdk-alpine
COPY target/my-app-1.0-SNAPSHOT.jar my-app.jar
ENTRYPOINT ["java","-jar","/my-app.jar"]

