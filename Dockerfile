FROM maven:3.8.6-openjdk-18-slim AS build
COPY src home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:18-alpine
COPY --from=build /home/app/target/tutorial-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]

