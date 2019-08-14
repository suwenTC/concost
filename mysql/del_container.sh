#!/bin/bash

i=0
while [ $i -lt $1 ]
do
    docker rm -f "db$i"
    i=$(( $i + 1 ))
done
