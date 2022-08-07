#!/bin/bash

for entry in ./*/
do 
    docker-compose -f ${entry}/docker-compose.yml up -d
done
