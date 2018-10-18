FROM mysql
LABEL maintainer="Don Corley <dcorley@usc.edu>"

RUN apt-get update && apt-get install -y netcat-openbsd
COPY ./seed-mysql.sh .
RUN chmod 700 ./seed-mysql.sh
COPY ./initdb.sql .

ENTRYPOINT ["/bin/sh", "./seed-mysql.sh"]