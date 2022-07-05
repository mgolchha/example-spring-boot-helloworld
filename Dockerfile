FROM fabric8/java-centos-openjdk11-jdk

LABEL org.opencontainers.image.authors="midcicd@puzzle.ch"

EXPOSE 8080 9000

LABEL io.k8s.description="Example Spring Boot App" \
      io.k8s.display-name="APPUiO Spring Boot App" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,springboot"

RUN mkdir -p /tmp/src/
ADD . /tmp/src/
RUN chmod 777 .gradle/
RUN cd /tmp/src && sh gradlew build -Dorg.gradle.daemon=false

RUN ln -s /tmp/src/build/libs/springboots2idemo*.jar /deployments/springboots2idemo.jar
