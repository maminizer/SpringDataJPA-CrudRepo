FROM openjdk:8-jdk-alpine
EXPOSE 8081
ADD target/*.war /
ENTRYPOINT ["java", "-jar", "Timesheet-spring-boot.war"]
