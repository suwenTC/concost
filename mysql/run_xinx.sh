#!/bin/bash

start=$(date +%s)
start_date=$(date)
i=0
while [ $i -lt $(( $1 - 1 )) ]
do
    docker exec "db$i" ./run_queries.sh "$1in$1_$i" > /dev/null 2>&1 &
    i=$(( $i + 1 ))
done

docker exec "db$i" ./run_queries.sh "$1in$1_$i" > /dev/null 2>&1

end=$(date +%s)
end_date=$(date)
touch time_cost/overall.txt
time_cost=$(( end - start ))
echo "$start_date, $time_cost, $end_date" > time_cost/overall.txt
