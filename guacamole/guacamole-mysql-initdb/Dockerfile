# uscdev/guacamole-mysql-initdb
FROM mysql
# FROM mysql:5.7
MAINTAINER dcorley@usc.edu

# ADD initdb.sql /docker-entrypoint-initdb.d/
ADD dump.sql /docker-entrypoint-initdb.d/
