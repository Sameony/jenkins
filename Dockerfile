FROM openjdk:11
EXPOSE 8069
ADD target/springboot-k8s-0.0.1-SNAPSHOT.jar springboot-k8s-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/springboot-k8s-0.0.1-SNAPSHOT.jar"]