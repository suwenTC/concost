#!/bin/bash

start=$(date +%s)
docke exec db0 ./run_queries.sh 5in5_1 > /dev/null 2&>1 &
docke exec db1 ./run_queries.sh 5in5_2 > /dev/null 2&>1 &
docke exec db2 ./run_queries.sh 5in5_3 > /dev/null 2&>1 &
docke exec db3 ./run_queries.sh 5in5_4 > /dev/null 2&>1 &
docke exec db4 ./run_queries.sh 5in5_5 > /dev/null 2&>1
end=$(date +%s)
touch time_cost/oveall.txt
time_cost=$(( end - start ))
echo $time_cost > time_cost/oveall.txt
