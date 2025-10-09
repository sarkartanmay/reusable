FROM docker.elastic.co/logstash/logstash:8.15.3

# Install curl and unzip
USER root
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Download and extract MySQL Connector/J
RUN curl -L -o /tmp/mysql-connector.zip https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-8.4.0.zip \
    && unzip /tmp/mysql-connector.zip -d /tmp/ \
    && mv /tmp/mysql-connector-j-8.4.0/mysql-connector-j-8.4.0.jar /usr/share/logstash/logstash-core/lib/jars/ \
    && rm -rf /tmp/mysql-connector.zip /tmp/mysql-connector-j-8.4.0

USER logstash
