#!/bin/bash

#modify etc/hosts file to avoid connection error
cp /etc/hosts /etc/hostsbak
sed -i 's/::1/#::1/' /etc/hostsbak
cat /etc/hostsbak > /etc/hosts
rm -rf /etc/hostsbak
#run wordcount example
/usr/bin/restart_hadoop_spark.sh
touch "/root/time_cost/$1.txt"
start=$(date +%s)
start_date=$(date)
${HIBENCH_HOME}/bin/workloads/ml/kmeans/prepare/prepare.sh
${HIBENCH_HOME}/bin/workloads/ml/kmeans/spark/run.sh
end_date=$(date)
time_cost=$(( end - start ))
echo "$start_date, $end_date, $time_cost" > "/root/time_cost/spark_$1.txt"
