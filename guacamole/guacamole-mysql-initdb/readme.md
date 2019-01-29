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

To create a base file:

1. Start stack
2. Copy initdb.sql to sql container
3. Start mysql -h localhost -u guacamole_user -p
4. use guacamole_db
5. source initdb.sql
6. browser: localhost:8082/guacamole
7. guacadmin/guacadmin
8. User -> settings
9. Connection tab
10. Add connection

11. Enter:
Name: chrome
Hostname: chrome
Port: 5900
Password: secret

12. Enter firefox info
13. docker exec -it container bash
14. mysqldump --databases guacamole_db -u guacamole_user -p > /tmp/dump.sql
15. Copy file out of container
16. Build new populated container