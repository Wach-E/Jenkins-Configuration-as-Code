#!/bin/bash

# sleep 15
cd /home/ubuntu/files/
export ip_address=$(dig +short myip.opendns.com @resolver1.opendns.com)
sed -i "s/server_ip/$ip_address/g" casc.yaml
docker build -t jenkins:jcasc .

docker run --name jenkins -p 8080:8080 -d \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker \
--env JENKINS_ADMIN_ID=admin --env JENKINS_ADMIN_PASSWORD=password jenkins:jcasc