#!/usr/bin/env bash
#启动一个docker容器；
xhost +local:root 1>/dev/null 2>&1
docker start mit_6s081 1>/dev/null 2>&1
docker exec \
    -it mit_6s081 \
    /bin/bash 
xhost -local:root 1>/dev/null 2>&1
