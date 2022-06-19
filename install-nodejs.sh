#!/bin/bash

# install nodejs and pm2

clear
echo 'We are going to install NodeJS for you... '
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash
yum install -y gcc-c++ make
yum install -y nodejs

clear
echo 'We are going to install pm2 for you... '
npm install -g pm2 yarn --registry=https://registry.npm.taobao.org

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