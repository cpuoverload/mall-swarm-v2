#!/bin/bash
docker pull mall/mall-admin:1.0-SNAPSHOT || true
docker stop mall-admin || true
docker rm mall-admin || true
docker run -p 8080:8080 --name mall-admin \
--link nacos-registry:nacos-registry \
--link mysql:db \
--link redis:redis \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-admin/logs:/var/logs \
-d mall/mall-admin:1.0-SNAPSHOT
