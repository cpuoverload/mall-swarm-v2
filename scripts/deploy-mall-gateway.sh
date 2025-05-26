#!/bin/bash
docker pull $DOCKER_IMAGE || true
docker rm -f mall-gateway || true
docker run -p 8201:8201 --name mall-gateway \
--link nacos-registry:nacos-registry \
--link mysql:db \
--link redis:redis \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-gateway/logs:/var/logs \
-d $DOCKER_IMAGE
