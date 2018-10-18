#!/bin/sh

: ${MYSQL_HOST:=mysql}
: ${MYSQL_PORT:=3306}

until nc -z $MYSQL_HOST $MYSQL_PORT
do
    echo "Waiting for MYSQL ($MYSQL_HOST:$MYSQL_PORT) to start..."
    sleep 0.5
done

eval $*