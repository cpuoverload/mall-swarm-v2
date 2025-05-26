#!/bin/bash
docker pull $DOCKER_IMAGE || true
docker rm -f mall-portal || true
docker run -p 8085:8085 --name mall-portal \
--link nacos-registry:nacos-registry \
--link mysql:db \
--link redis:redis \
--link mongo:mongo \
--link rabbitmq:rabbit \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-portal/logs:/var/logs \
-d $DOCKER_IMAGE
