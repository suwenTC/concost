#!/bin/bash

start=$(date +%s)
start_date=date
i=0
while [ $(( $i - 1 )) -lt $1 ]
do
    docker exec "db$i" ./run_queries.sh "5in5_$i" > /dev/null 2>&1 &
done

docker exec "db$i" ./run_queries.sh "5in5_$i" > /dev/null 2>&1

end=$(date +%s)
end_date=date
touch time_cost/oveall.txt
time_cost=$(( end - start ))
echo "$start_date, $time_cost, $end_date" > time_cost/oveall.txt
