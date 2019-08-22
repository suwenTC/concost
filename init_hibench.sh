#!/bin/bash

sudo apt-get update
sudo apt-get install -y docker.io

cd ~
git clone https://github.com/suwenTC/concost.git
git clone https://github.com/Intel-bigdata/HiBench.git
git clone https://github.com/zsl3203/summer.git

cp $(pwd)/concost/big_data/Dockerfile $(pwd)/HiBench/docker/opensource-docker/
cp $(pwd)/concost/big_data/hibench.conf $(pwd)/HiBench/docker/base/conf
cp $(pwd)/concost/big_data/kmeans.conf $(pwd)/HiBench/docker/opensource-docker/conf
#cp $(pwd)/concost/big_data/prepare.sh $(pwd)/HiBench/docker/opensource-docker/scripts
cp $(pwd)/concost/big_data/run_container.sh $(pwd)/HiBench/docker/scripts
cp $(pwd)/concost/big_data/run_container5.sh $(pwd)/HiBench/docker/scripts
cp $(pwd)/concost/big_data/run_xwithgap.py $(pwd)/HiBench/docker/scripts
cp $(pwd)/concost/big_data/runexample.sh $(pwd)/HiBench/docker/opensource-docker/scripts
cp $(pwd)/concost/big_data/runexample_spark.sh $(pwd)/HiBench/docker/opensource-docker/scripts
#cp $(pwd)/concost/big_data/runexample5.sh $(pwd)/HiBench/docker/opensource-docker/scripts
sudo bash $(pwd)/HiBench/docker/scripts/build_docker.sh open-source
