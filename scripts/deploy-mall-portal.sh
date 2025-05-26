#!/bin/bash
docker pull mall/mall-portal:1.0-SNAPSHOT || true
docker stop mall-portal || true
docker rm mall-portal || true
docker run -p 8085:8085 --name mall-portal \
--link nacos-registry:nacos-registry \
--link mysql:db \
--link redis:redis \
--link mongo:mongo \
--link rabbitmq:rabbit \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-portal/logs:/var/logs \
-d mall/mall-portal:1.0-SNAPSHOT
