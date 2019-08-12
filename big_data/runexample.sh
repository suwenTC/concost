#!/bin/bash

#modify etc/hosts file to avoid connection error
cp /etc/hosts /etc/hostsbak
sed -i 's/::1/#::1/' /etc/hostsbak
cat /etc/hostsbak > /etc/hosts
rm -rf /etc/hostsbak
#run wordcount example
#/usr/bin/restart_hadoop_spark.sh

service ssh restart

# restart hdfs                                                       
${HADOOP_HOME}/sbin/start-dfs.sh

# restart yarn                                                               
${HADOOP_HOME}/sbin/start-yarn.sh

# restart spark                                                               
${SPARK_HOME}/sbin/start-all.sh

${HADOOP_HOME}/bin/hdfs dfs -ls /HiBench/Wordcount/Input/

${HADOOP_HOME}/bin/hadoop dfsadmin -safemode leave

${HIBENCH_HOME}/bin/workloads/micro/wordcount/hadoop/run.sh
#cat  /root/HiBench/report/wordcount/hadoop/conf/../bench.log
