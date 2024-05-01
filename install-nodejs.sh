#!/bin/bash
###
 # @Author: leyi leyi@myun.info
 # @Date: 2020-04-21 22:09:28
 # @LastEditors: leyi leyi@myun.info
 # @LastEditTime: 2024-05-01 21:52:45
 # @FilePath: /centos_install_shell/install-nodejs.sh
 # @Description: 
 # 
 # Copyright (c) 2022 by leyi leyi@myun.info, All Rights Reserved. 
### 

# install nodejs and pm2

clear
echo 'We are going to install NodeJS for you... '
yum install -y gcc-c++ make

# yum install https://rpm.nodesource.com/pub_16.x/nodistro/repo/nodesource-release-nodistro-1.noarch.rpm -y
# yum install nodejs -y --setopt=nodesource-nodejs.module_hotfixes=1

# installs NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# download and install Node.js
nvm install 20
clear
echo 'We are going to install pm2,yarn,pnpm for you... '
npm install -g pm2 yarn pnpm --registry=https://registry.npmmirror.com

clear
echo 'We are going to install pm2-logrotate for you... '
pm2 install pm2-logrotate
pm2 set pm2-logrotate:max_size 10M
pm2 set pm2-logrotate:dateFormat YYYY-MM-DD_HH-mm-ss
pm2 set pm2-logrotate:workerInterval 3600
pm2 set pm2-logrotate:rotateInterval 0 0 * * *
pm2 set pm2-logrotate:TZ Asia/Shanghai

clear
echo "NodeJS is now installed @ version:"
node --version