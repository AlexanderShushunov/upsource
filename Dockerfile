# Upsource server environment for ubuntu 
FROM ubuntu
MAINTAINER ashushunov <ashushunov@mail.ru>
CMD ["/sbin/my_init"]

# copy build scripts
ADD . /build-docker-image
RUN chmod +x /build-docker-image/*.sh

# Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections

# Change limits
RUN /build-docker-image/change-limits-conf.sh

# Install dependencies
RUN /build-docker-image/install-java-8-oracle.sh
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN apt-get -y install wget unzip

# Download and install upsource
ENV UPSOURCE_HOME /usr/local/upsource
RUN /build-docker-image/install-upsource.sh $UPSOURCE_HOME 2.0.3462

#Setup host
RUN $UPSOURCE_HOME/bin/upsource.sh configure --listen-port 8080
EXPOSE 8080

# Create script to start upsource blocking it (avoid container termination)
RUN /build-docker-image/make-start-and-go-to-inf-loop.sh $UPSOURCE_HOME

# Cleanup
RUN	/build-docker-image/cleanup.sh