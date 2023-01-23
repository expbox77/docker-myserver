#!/bin/bash

env_dir='env'

if [ ! -d $env_dir ]; then
    echo -e "${env_dir} 경로가 존재하지 않아 생성합니다."
    mkdir $env_dir
fi

bash ./dashdot/set_env.sh
docker-compose -f ./dashdot/docker-compose.yml up -d