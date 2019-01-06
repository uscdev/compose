## Initializing the Guacamole database

To initialize the guacamole database, run this container one time.
It will populate the guacamole database with initial values.

## Building the container

````bash
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sql
docker build -t uscdev/guacamole-mysql-populated:5.7 .
docker push uscdev/guacamole-mysql-populated:5.7
````

Note: To make this real useful, start up guacamole, set up the environment and 
re mysqldump the SQL.
