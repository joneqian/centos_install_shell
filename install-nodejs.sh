#!/bin/bash

# install nodejs and pm2

clear
echo 'We are going to install NodeJS for you... '
curl -sL https://rpm.nodesource.com/setup_14.x | bash -
yum install -y gcc-c++ make
yum install -y nodejs

clear
echo 'We are going to install pm2 for you... '
npm install -g pm2 yarn --registry=https://registry.npm.taobao.org

clear
echo "NodeJS is now installed @ version:"
node --version