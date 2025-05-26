#!/bin/bash
docker pull mall/mall-monitor:1.0-SNAPSHOT || true
docker stop mall-monitor || true
docker rm mall-monitor || true
docker run -p 8101:8101 --name mall-monitor \
--link nacos-registry:nacos-registry \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/mall-monitor/logs:/var/logs \
-d mall/mall-monitor:1.0-SNAPSHOT
