#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.



CUR_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
HOME_DIR=${CUR_DIR}/..


function build-base() {
echo "============================================"
echo "   Start building hibench-base image...     "
echo "============================================"
#bash ${CUR_DIR}/gen_base_dockerfile.sh
sudo docker build -t hibench-base ${HOME_DIR}/base/
}

function second-step() {
echo "============================================"
echo "   Start building hibench-docker image...   "
echo "============================================"
}

case "$1" in
  "cdh")
     build-base
     second-step
     sudo docker build -t hibench-docker-cdh ${HOME_DIR}/cdh-docker/
     ;;
  "open-source")
     build-base
     second-step
     sudo docker build -t hibench-docker-opensource ${HOME_DIR}/opensource-docker/
     ;;
  *)
     exit 1
     ;;
esac

