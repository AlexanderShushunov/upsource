#!/bin/bash
# Do not forget add in docker file ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Never ask for confirmations
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

# add repo with java 8
apt-get update && apt-get install -y software-properties-common
add-apt-repository -y ppa:webupd8team/java
у
#install Java
apt-get update && apt-get install -y oracle-java8-installer 

#cleanup
rm -rf /var/cache/oracle-jdk8-installer
