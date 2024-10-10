FROM openjdk:17-oracle
LABEL maintainer="Alfonso Rivero <devil861109@gmail.com>"
EXPOSE 8081
ARG JAR_FILE=target/*.jar
COPY target/*.jar app.jar
CMD ["java", "-jar", "/app.jar"]