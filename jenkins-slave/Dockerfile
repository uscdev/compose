# Thanks Ervin Varga <ervin.varga@gmail.com> evarga/jenkins-slave
FROM uscdev/centos
MAINTAINER Don Corley <dcorley@usc.edu>

# In case you need proxy
#RUN echo 'Acquire::http::Proxy "http://127.0.0.1:8080";' >> /etc/apt/apt.conf

# Add locales after locale-gen as needed
# Upgrade packages on image
# Preparations for sshd
# RUN localectl set-locale LANG=en_US.utf-8

RUN    yum -y update
RUN    yum -y install openssh-server
RUN    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN    mkdir -p /var/run/sshd

ENV LANG en_US.utf-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.utf-8

# Install JDK 8 (latest edition)
RUN yum -y update &&\
    yum install -y java-1.8.0-openjdk.i686

# Set user jenkins to the image
RUN useradd -m -d /home/jenkins -s /bin/sh jenkins &&\
    echo "jenkins:jenkins" | chpasswd

# Standard SSH port
EXPOSE 22

# Default command
CMD ["/usr/sbin/sshd", "-D"]
