#!/bin/bash

# install tools:vim wget git
clear
echo 'We are going to install vim,wget and git for you... '
yum update -y
yum install -y vim wget git

clear
echo 'downing install shell... '
wget https://qq-developer.oss-cn-hangzhou.aliyuncs.com/centos_tool_install/install-nodejs.sh
wget https://qq-developer.oss-cn-hangzhou.aliyuncs.com/centos_tool_install/install-nginx.sh
wget https://qq-developer.oss-cn-hangzhou.aliyuncs.com/centos_tool_install/install-redis.sh
chmod +x *.sh
./install-nodejs.sh
./install-nginx.sh
./install-redis.sh
