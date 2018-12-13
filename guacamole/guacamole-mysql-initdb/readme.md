## Initializing the Guacamole database

To initialize the guacamole database, run this container one time.
It will populate the guacamole database with initial values.

## Building the container

````bash
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sh
docker build -t uscdev/guacamole-mysql-populated:5.7 .
docker push uscdev/guacamole-mysql-populated:5.7
````
