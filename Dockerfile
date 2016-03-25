FROM ubuntu:latest
MAINTAINER talos team

#============
# Install vim
#============
RUN apt-get -y remove vim-tiny
RUN apt-get -y install vim

#====
# git
#====
RUN apt-get -y install git

#========
# Nodejs
#========
RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates
RUN mkdir /nodejs && curl http://nodejs.org/dist/v5.9.0/node-v5.9.0-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1
ENV PATH $PATH:/nodejs/bin

#======================
# set up work directory
#======================
RUN mkdir /tmp/circleci-to-docker
WORKDIR /tmp/circleci-to-docker

#=================================
#Clone a porject into Docker image
#=================================
RUN git clone https://github.com/kiemtech1/circleci-to-dockerhub.git
