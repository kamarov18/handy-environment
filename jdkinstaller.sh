#!/usr/bin/env bash

echo "---> Installing JDK...";

if [ "$jdk" == "openjdk6" ]; \
        then apt-get install -y openjdk-6-jdk;
    elif [ "$jdk" == "openjdk7" ]; \
        then apt-get install -y openjdk-7-jdk;
    elif [ "$jdk" == "openjdk8" ]; \
        then apt-get install -y openjdk-8-jdk;
    elif [ "$jdk" == "openjdk9" ]; \
        then apt-get install -y openjdk-9-jdk;
    elif [ "$jdk" == "openjdk10" ]; \
        then apt-get install -y openjdk-10-jdk;
    elif [ "$jdk" == "openjdk11" ]; \
        then apt-get install -y openjdk-11-jdk;
    elif [ "$jdk" == "openjdk15" ]; \
        then apt-get install -y openjdk-15-jdk;
    elif [ "$jdk" == "oraclejdk6" ]; \
        then echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
            add-apt-repository -y ppa:webupd8team/java && \
            apt-get update && \
            apt-get install -y oracle-java6-installer && \
            apt-get install oracle-java6-set-default && \
            rm -rf /var/cache/oracle-jdk6-installer;
    elif [ "$jdk" == "oraclejdk7" ]; \
        then echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
            add-apt-repository -y ppa:webupd8team/java && \
            apt-get update && \
            apt-get install -y oracle-java7-installer && \
            apt-get install oracle-java7-set-default && \
            rm -rf /var/cache/oracle-jdk7-installer;
     else
            echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
            add-apt-repository -y ppa:webupd8team/java && \
            apt-get update && \
            apt-get install -y oracle-java8-installer && \
            apt-get install oracle-java8-set-default && \
            rm -rf /var/cache/oracle-jdk8-installer;
fi

