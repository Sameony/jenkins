# Build Stage
FROM openjdk:11 AS build

WORKDIR /opt/app

COPY ./ /opt/app
RUN apt-get update
RUN apt-get install -y maven
RUN mvn clean install

# Run Stage
FROM openjdk:11

COPY --from=build /opt/app/target/*.jar app.jar

ENV PORT 8069
EXPOSE $PORT

ENTRYPOINT ["java","-jar","-Xmx1024M","-Dserver.port=${PORT}","app.jar"]
