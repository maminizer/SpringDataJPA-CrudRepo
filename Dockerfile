FROM openjdk:8-jdk-alpine
EXPOSE 8081
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

FROM jenkins

USER root

# in order to create the jenkins db
RUN apt-get update && apt-get -y install mysql-client

# install mysql plugin and repackage war
RUN curl -sSL --create-dirs -o /tmp/WEB-INF/plugins/database.hpi https://updates.jenkins-ci.org/latest/database.hpi \
  && curl -sSL --create-dirs -o /tmp/WEB-INF/plugins/database-mysql.hpi https://updates.jenkins-ci.org/latest/database-mysql.hpi \
  && cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/*/* && rm -rf /tmp/WEB-INF

COPY ./jenkins-mysql.sh /usr/local/bin/jenkins-mysql.sh

USER jenkins

CMD ["/usr/local/bin/jenkins-mysql.sh"]
