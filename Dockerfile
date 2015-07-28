############################################################
# Dockerfile to run Memcached Containers
# Based on Ubuntu Image
############################################################

# Set the base image to use to Ubuntu
FROM ubuntu

# Set the file maintainer (your name - the file's author)
MAINTAINER Wynter Woods

# Update the default application repository sources list
RUN apt-get update

# Install Memcached
RUN apt-get install -y build-essential
RUN apt-get install -y wget
RUN apt-get install -y python
RUN apt-get install -y bc
RUN apt-get install -y git
RUN apt-get install -y cmake
RUN apt-get install -y unzip
RUN apt-get install -y device-tree-compiler
RUN apt-get install -y libncurses-dev
RUN apt-get install -y cu
RUN apt-get install -y libc6-i386
RUN apt-get install -y lib32stdc++6
RUN apt-get install -y lib32z1

RUN mkdir /chip-sdk/
ADD data/build-system /chip-sdk/build-system
VOLUME /chip-sdk/build

WORKDIR /chip-sdk/build-system
CMD ["/chip-sdk/build-system/build-chip.sh"]
