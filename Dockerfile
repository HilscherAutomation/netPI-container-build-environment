#use fixed armv7hf compatible raspbian OS version from group resin.io as base image
FROM resin/armv7hf-debian:jessie-20171021

#enable building ARM container on x86 machinery on the web (comment out next 3 lines if built on Raspberry) 
ENV QEMU_EXECVE 1
COPY armv7hf-debian-qemu /usr/bin
RUN [ "cross-build-start" ]

#labeling
LABEL maintainer="netpi@hilscher.com" \
      version="V1.1.0.1" \
      description="Containerized Docker and Git for netPI onboard container developments"

#version
ENV HILSCHERNETPI_CONTAINER_BUILD_ENVIRONMENT 1.1.0.1

#execute all commands as root
USER root

#install SSH 
RUN apt-get update  \
    && apt-get install -y openssh-server

#do users
RUN echo 'root:root' | chpasswd \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
    && mkdir /var/run/sshd 

#install git, nano and docker
RUN apt-get install -y git nano \
    && curl -sSL https://get.docker.com | sh

#SSH Port
EXPOSE 22

#set stop signal 
STOPSIGNAL SIGTERM

#do entrypoint
COPY "entrypoint.sh" /
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

#stop processing ARM emulation (comment out next line if built on Raspberry)
RUN [ "cross-build-end" ]
