# Getting Started

## Project

Implementation of simple CRUD application made in Spring Boot
Created for testing connection between MongoDB Atlas and Docker.
We have 2 endpoints:
* **/addUser** - create a new user and insert into the database
* **/getAllUser** - list all users

## Instructions

Follow this instructions to deploy correctly into docker and docker hub

### 1. Install Java in local machine

Check if version is already installed
Project is configured to work with version 17

- ***apt install openjdk-17-jdk openjdk-17-jre***

### 2. Install Maven

We can't just install using apt-get, it installs an older version, so we need to download from web.

- ***https://maven.apache.org/download.cgi***
- ***tar -xzf apache-maven-3.9.4-bin.tar.gz***
- ***sudo mv apache-maven-3.9.4 /opt/maven*** 

### 3. Configure Env Variables for Maven

We need to create a file to put all this environment variables from maven execution

- ***sudo nano /etc/profile.d/maven.sh***

After the creation of the file, we need to add this configuration inside

- ***sudo nano /etc/profile.d/maven***

- ***export JAVA_HOME=/usr/lib/jvm/default-java***
- ***export M3_HOME=/opt/maven***
- ***export MAVEN_HOME=/opt/maven***
- ***export PATH=\${M3_HOME}/bin:${PATH}***

This command is used to change file to executable

- ***sudo chmod +x /etc/profile.d/maven.sh***

This command is used to reaffirm changes without rebooting \
source is a Bash shell built-in command that executes the content of the file passed as an argument in the current shell.

- ***source /etc/profile.d/maven.sh***

When all of this is done, check mvn version

- ***mvn --version***

### 4. Repo Clone

- ***git clone https://github.com/devil861109/DIP_CONTAINERS.git***

**main** branch is configured with the simplest Dockerfile possible, to use with Mongo Atlas \
**fix** branch is configured with a better Dockerfile to review

### 5 Create Mongo Atlas Account

We need to create a Mongo Atlas account, then create a database, create a cluster and finally create a collection \
Go to Class PDF for more detail into this

### 6. Configure Security in Mongo Atlas

Create connection user \
Configure entrance IP to the database

### 7. Add Env variables to O.S.

We can use this location, or either, we can use the maven.sh file we created previously

***sudo nano /etc/environment***

Use nano to create this env variables with the correct values for each one

***export MONGO_HOSTNAME="mongodb+srv://\<user>:\<password>@cluster0.m32af.mongodb.net/\<database>"*** \
***export MONGO_DB="\<database>"*** \
***export MONGO_USER="\<user>"*** \
***export MONGO_PWD="\<password>"*** \
***export TOMCAT_PORT="\<port>"***

Then, end with env refresh

***source /etc/environment***

### 8. Compile with Maven

***mvn clean package***

Once file is compiled, it creates a folder name 'target' with jar file

### 9. Execute docker build command

***docker build -t cloud-usuario-service/springboot-docker:tag .***

### 10. Run the container

In this case, we expose port 8081, inside and outside the container

***docker run -p 8081:8081 cloud-usuario-service/springboot-docker:tag***

We can create all tags we need so that image can be deployed into docker hub \
Do not forget to chec IPs in Mongo Atlas

### 11. Postman Testing

Create User Endpoint (POST)

***http://\<IP_CONTAINER\>:8081/addUser***

{
"name": "Test",
"age": 50
}

Check All Users Endpoint (GET)

***http://\<IP_CONTAINER\>:8081/getAllUser***

### 12. Login docker hub

***docker login***

### 13. Upload to Docker Hub

***docker push devil861109/springboot-docker:v1.0***

### Reference Documentation
For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/2.7.15/maven-plugin/reference/html/)
* [Create an OCI image](https://docs.spring.io/spring-boot/docs/2.7.15/maven-plugin/reference/html/#build-image)
* [Spring Web](https://docs.spring.io/spring-boot/docs/2.7.15/reference/htmlsingle/index.html#web)
* [Spring Data MongoDB](https://docs.spring.io/spring-boot/docs/2.7.15/reference/htmlsingle/index.html#data.nosql.mongodb)

### Guides
The following guides illustrate how to use some features concretely:

* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/rest/)
* [Accessing Data with MongoDB](https://spring.io/guides/gs/accessing-data-mongodb/)