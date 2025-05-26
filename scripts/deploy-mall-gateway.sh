#!/bin/bash
docker pull mall/mall-gateway:1.0-SNAPSHOT || true
docker stop mall-gateway || true
docker rm mall-gateway || true
docker run -p 8201:8201 --name mall-gateway \
--link nacos-registry:nacos-registry \
--link mysql:db \
--link redis:redis \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-gateway/logs:/var/logs \
-d mall/mall-gateway:1.0-SNAPSHOT
