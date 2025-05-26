#!/bin/bash
docker pull $DOCKER_IMAGE || true
docker rm -f mall-admin || true
docker run -p 8080:8080 --name mall-admin \
--link nacos-registry:nacos-registry \
--link mysql:db \
--link redis:redis \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-admin/logs:/var/logs \
-d $DOCKER_IMAGE
