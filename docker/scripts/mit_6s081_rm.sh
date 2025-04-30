#!/usr/bin/env bash
echo "stop and rm docker" 
docker stop mit_6s081 > /dev/null
docker rm -v -f mit_6s081 > /dev/null