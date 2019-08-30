#!/bin/bash

cp /etc/hosts /etc/hostsbak
sed -i 's/::1/#::1/' /etc/hostsbak
cat /etc/hostsbak > /etc/hosts
rm -rf /etc/hostsbak
                                                       
/usr/bin/restart_hadoop_spark.sh
${HIBENCH_HOME}/bin/workloads/micro/wordcount/prepare/prepare.sh
