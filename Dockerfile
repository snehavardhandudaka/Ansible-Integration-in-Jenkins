# Use a base image that contains Java
FROM openjdk:17-jdk

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container
COPY target/my-app-1.0-SNAPSHOT.jar /app/myapp.jar

# Specify the command to run the application
CMD ["java", "-jar", "myapp.jar"]

