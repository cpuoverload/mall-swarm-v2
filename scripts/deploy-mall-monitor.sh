#!/bin/bash
docker pull $DOCKER_IMAGE || true
docker rm -f mall-monitor || true
docker run -p 8101:8101 --name mall-monitor \
--link nacos-registry:nacos-registry \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-monitor/logs:/var/logs \
-d $DOCKER_IMAGE
