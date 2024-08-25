FROM tomcat:11.0-jre21
RUN rm -rf /usr/local/tomcat/webapps/*

COPY build/libs/test_ecr-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8081

CMD ["catalina.sh", "run"]