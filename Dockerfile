FROM tomcat:11.0-jre21
RUN rm -rf /usr/local/tomcat/webapps/*

COPY build/libs/test_ecr-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# COPY downloaded gradle binary to dokcer
COPY gradle-8.8 /opt

# testing
ENV GRADLE_VERSION=8.8
ENV GRADLE_HOME=/opt/gradle

# link 
RUN ln -s /opt/gradle-8.8 ${GRADLE_HOME}

# PATH
ENV PATH="${GRADLE_HOME}/bin:${PATH}"



EXPOSE 8081

CMD ["catalina.sh", "run"]