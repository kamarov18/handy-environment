FROM ubuntu:latest

ARG USER=1001
ARG S2IDIR="/home/s2i"
ARG APPDIR="/deployments"

LABEL maintainer="Huseyin Akdogan <hakdogan@kodcu.com>" \
      io.k8s.description="S2I builder for Java Applications." \
      io.k8s.display-name="KODCU JDK Provider" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java" \
      io.openshift.s2i.scripts-url="image:///home/s2i/bin"

COPY jdkinstaller.sh "$APPDIR/"
COPY s2i $S2IDIR
RUN chmod 777 -R $S2IDIR

RUN useradd $USER \
    && chown $USER:$USER $APPDIR \
    && addgroup $USER $USER \
    && chmod 777 -R $APPDIR

RUN apt-get update -y && \
    apt-get install -y software-properties-common

RUN ["/bin/bash", "-c", "$APPDIR/jdkinstaller.sh"]

RUN apt-get install maven -y && \
    apt-get install -y unzip && \
    wget https://services.gradle.org/distributions/gradle-4.10.2-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-4.10.2-bin.zip && \
    ls /opt/gradle/gradle-4.10.2

ENV PATH=$PATH:/opt/gradle/gradle-4.10.2/bin
RUN rm -rf /var/lib/apt/lists/*

WORKDIR $APPDIR

EXPOSE 8080

USER $USER

CMD ["/home/s2i/bin/run"]
