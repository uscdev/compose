# Create Jenkins image with USC plugins and utilities such as docker

FROM maven

COPY pom.xml /tmp/pom.xml
RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve

COPY src /tmp/src

RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings-docker.xml package
