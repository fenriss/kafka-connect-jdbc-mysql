FROM openjdk:8

RUN apt-get update
RUN apt-get install -y  
RUN apt-get install curl -y
RUN curl -O http://packages.confluent.io/archive/5.5/confluent-5.5.0-2.12.zip
RUN apt-get install unzip -y
RUN apt-get install nano -y
RUN unzip confluent-5.5.0-2.12.zip
COPY source-quickstart-mysql.properties /confluent-5.5.0/etc/kafka-connect-jdbc/
COPY connect-standalone.properties /confluent-5.5.0/etc/kafka/
COPY mysql-connector-java-8.0.20.jar /confluent-5.5.0/share/java/kafka-connect-jdbc/

CMD ["/bin/bash"]