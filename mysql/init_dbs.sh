#!/bin/bash

i=0
while [ $i -lt $1 ]
do
    docker run --name "db$i" -v /proj/shield-PG0/yarp/:/root/sql/ -v $(pwd)/time_cost:/root/time_cost -e MYSQL_ROOT_PASSWORD=1234 -d suwenbrucegu/mysql:latest
    i=$(( $i + 1 ))
    sleep 10
done

#docker run --name xin1 -v $(pwd)/time_cost:/root/time_cost -e MYSQL_ROOT_PASSWORD=1234 -d suwenbrucegu/mysql:latest
