# Docker Build Stage
FROM openjdk:11


# Copy folder in docker
WORKDIR /opt/app

COPY ./ /opt/app
RUN mvn clean install


# Run spring boot in Docker
FROM openjdk:11

COPY --from=build /opt/app/target/*.jar app.jar

ENV PORT 8069
EXPOSE $PORT

ENTRYPOINT ["java","-jar","-Xmx1024M","-Dserver.port=${PORT}","app.jar"]
