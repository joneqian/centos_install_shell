#!/bin/bash
###
 # @Author: leyi leyi@myun.info
 # @Date: 2020-04-21 22:09:28
 # @LastEditors: leyi leyi@myun.info
 # @LastEditTime: 2024-01-31 14:47:06
 # @FilePath: /centos_install_shell/install.sh
 # @Description: 
 # 
 # Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
### 

# install tools:vim wget git
clear
echo 'We are going to install vim,wget and git... '
yum update -y
yum install -y vim wget git epel-release
yum install -y htop

clear
echo 'We are going to enable firewalld... '
systemctl enable firewalld.service
systemctl start firewalld.service

clear
echo 'downing install shell... '
wget https://qq-developer.oss-cn-hangzhou.aliyuncs.com/centos_tool_install/install-nodejs.sh
wget https://qq-developer.oss-cn-hangzhou.aliyuncs.com/centos_tool_install/install-nginx.sh
wget https://qq-developer.oss-cn-hangzhou.aliyuncs.com/centos_tool_install/install-redis.sh
chmod +x *.sh
./install-nodejs.sh
./install-nginx.sh
./install-redis.sh
