#!/bin/bash

docker run --name vae0 vae ./run.sh &
sleep 100
docker run --name vae1 vae ./run.sh &
sleep 100
docker run --name vae2 vae ./run.sh &
sleep 100
docker run --name vae3 vae ./run.sh &
sleep 100
docker run --name vae4 vae ./run.sh
