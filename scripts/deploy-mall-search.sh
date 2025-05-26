#!/bin/bash
docker pull mall/mall-search:1.0-SNAPSHOT || true
docker stop mall-search || true
docker rm mall-search || true
docker run -p 8081:8081 --name mall-search \
--link nacos-registry:nacos-registry \
--link elasticsearch:es \
--link mysql:db \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-search/logs:/var/logs \
-d mall/mall-search:1.0-SNAPSHOT
