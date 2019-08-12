#!/bin/bash

i=0
while [ $i -lt $1 ]
do
    docker run --name "db$i" -e MYSQL_ROOT_PASSWORD=1234 -d suwenbrucegu/mysql
    i=$(( $i + 1 ))
done
