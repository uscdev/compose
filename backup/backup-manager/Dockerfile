FROM osixia/backup-manager

ENV DEBIAN_FRONTEND noninteractive
# RUN apt-get -y update && apt-get install -y postgresql-client
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y mongodb-clients lsb-release wget
RUN wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb
RUN dpkg -i mysql-apt-config_0.8.10-1_all.deb
RUN apt-get -y update
RUN apt-get install -y mysql-client
