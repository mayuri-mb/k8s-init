#!/bin/bash

#1. check if location exist or not
#2. if exists, read it and export it, then call mysql entrypoint script
#3. If does not exist, throw the error

if [ -f /secrets/mysql-secret-reader.txt]; then
    PASSWORD = $(cat /secrets/mysql-secret-reader.txt)
    echo "password accessed successfully"
else
    echo "can't find the secret file"
    exit 1
fi 

export MYSQL_ROOT_PASSWORD = $PASSWORD
rm /secrets/mysql-secret-reader.txt

exec /usr/local/bin/docker-entrypoint.sh mysqld
