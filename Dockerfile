FROM openjdk:17-oracle
LABEL maintainer="Alfonso Rivero <devil861109@gmail.com>"
ENV MONGO_HOSTNAME mongodb+srv://<username>:<password>@cluster.url.mongodb.net/<database>
ENV MONGO_DB <database>
ENV MONGO_USER <username>
ENV MONGO_PWD <password>
ENV TOMCAT_PORT 8081
EXPOSE 8081
ARG JAR_FILE=target/*.jar
COPY target/*.jar app.jar
CMD ["java", "-jar", "/app.jar"]