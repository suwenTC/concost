#!/bin/bash

docker run --name vae0 --cpus="3.2" vae ./run.sh &
sleep 100
docker run --name vae1 --cpus="3.2" vae ./run.sh &
sleep 100
docker run --name vae2 --cpus="3.2" vae ./run.sh &
sleep 100
docker run --name vae3 --cpus="3.2" vae ./run.sh &
sleep 100
docker run --name vae4 --cpus="3.2" vae ./run.sh
