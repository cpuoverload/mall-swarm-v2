#!/bin/bash
docker pull $DOCKER_IMAGE || true
docker rm -f mall-auth || true
docker run -p 8401:8401 --name mall-auth \
--link nacos-registry:nacos-registry \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-auth/logs:/var/logs \
-d $DOCKER_IMAGE
