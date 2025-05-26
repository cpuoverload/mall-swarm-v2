#!/bin/bash
docker pull mall/mall-auth:1.0-SNAPSHOT || true
docker stop mall-auth || true
docker rm mall-auth || true
docker run -p 8401:8401 --name mall-auth \
--link nacos-registry:nacos-registry \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-auth/logs:/var/logs \
-d mall/mall-auth:1.0-SNAPSHOT
