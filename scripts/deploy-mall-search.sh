#!/bin/bash
docker pull $DOCKER_IMAGE || true
docker rm -f mall-search || true
docker run -p 8081:8081 --name mall-search \
--link nacos-registry:nacos-registry \
--link elasticsearch:es \
--link mysql:db \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-search/logs:/var/logs \
-d $DOCKER_IMAGE
