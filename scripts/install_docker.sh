# put some script here
#!/bin/bash
sudo yum -y update
sudo yum install docker -y
docker --version
docker info