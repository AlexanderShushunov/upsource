# Upsource server environment for ubuntu 
# Start with phusion/baseimage 
FROM phusion/baseimage
MAINTAINER ashushunov <ashushunov@mail.ru>
CMD ["/sbin/my_init"]

# copy build scripts
ADD . /build-docker-image
RUN chmod +x /build-docker-image/*.sh

# Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections

# Install dependencies
RUN apt-get update && \
	apt-get -y install python-software-properties bzip2 software-properties-common wget unzip openjdk-7-jdk

# Download and install upsource
ENV UPSOURCE_HOME /usr/local/upsource
RUN /build-docker-image/install-upsource.sh $UPSOURCE_HOME 2.0.3462

#Export JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-amd64
RUN export PATH=~/bin:$JAVA_HOME/bin:$PATH

#Setup hosts 
RUN $UPSOURCE_HOME/upsource.sh configure --listen-port 8080
EXPOSE 8080

# Create script to start upsource blocking it (avoid container termination)
RUN /build-docker-image/make-start-and-go-to-inf-loop.sh $UPSOURCE_HOME

# Cleanup
RUN	/build-docker-image/cleanup.sh