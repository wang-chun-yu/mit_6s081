#!/usr/bin/env bash
#启动docker容器的bash脚本；
MONITOR_HOME_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd )"
echo "MONITOR_HOME_DIR: ${MONITOR_HOME_DIR}"

display=""
if [ -z ${DISPLAY} ];then
    display=":1"
else
    display="${DISPLAY}"
fi

local_host="$(hostname)"
user="${USER}"
uid="$(id -u)"
group="$(id -g -n)"
gid="$(id -g)"

# use images name
images_name="mit_6s081:latest"
user_name="devuser"
docker_name="mit_6s081"

echo "stop and rm docker" 
docker stop docker_name > /dev/null
docker rm -v -f docker_name > /dev/null

echo "start docker"
xhost +local:docker
docker run -it -d \
--name ${docker_name} \
-u ${user_name} \
-e DISPLAY=$display \
--privileged=true \
-e DOCKER_USER="${user}" \
-e USER="${user}" \
-e DOCKER_USER_ID="${uid}" \
-e DOCKER_GRP="${group}" \
-e DOCKER_GRP_ID="${gid}" \
-e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
-v ${MONITOR_HOME_DIR}:/home/${user_name}/work \
-v ${XDG_RUNTIME_DIR}:${XDG_RUNTIME_DIR} \
--net host \
${images_name} \