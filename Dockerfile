FROM tomcat:9.0.48-jdk11-openjdk-slim 

RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN rm -rf /usr/local/tomcat/conf/server.xml
RUN apt-get update && apt-get install libtcnative-1 libapr1-dev nano -y
COPY conf/hibernate.properties /opt/dhis2/config/hibernate.properties
COPY conf/dhis.conf /opt/dhis2/config/dhis.conf
RUN mkdir /backup
ADD conf/server.xml /usr/local/tomcat/conf/server.xml
ADD conf/dhis2.war /usr/local/tomcat/webapps/ROOT.war

RUN echo "export JAVA_OPTS=$JAVA_OPTS\nexport DHIS2_HOME='/opt/dhis2/config'" >> /usr/local/tomcat/bin/setenv.sh

