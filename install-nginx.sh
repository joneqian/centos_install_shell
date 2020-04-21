#!/bin/bash

# install nginx

clear
echo 'We are going to install nginx for you... '
yum install -y gcc-c++  pcre pcre-devel zlib zlib-devel openssl openssl-devel

clear
echo 'downding nginx....'
wget http://nginx.org/download/nginx-1.14.2.tar.gz
tar zxvf nginx-1.14.2.tar.gz

clear
echo 'installing nginx...'
cd nginx-1.14.2
./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_sub_module --with-http_ssl_module --with-http_gzip_static_module
make
make install

clear
echo 'configure and run nginx'
cd ../
mkdir /usr/local/nginx/conf.d
mkdir /usr/local/nginx/cert
wget https://qq-developer.oss-cn-hangzhou.aliyuncs.com/nginx_config/nginx.conf
wget https://qq-developer.oss-cn-hangzhou.aliyuncs.com/nginx_config/www.conf
wget https://qq-developer.oss-cn-hangzhou.aliyuncs.com/nginx_config/api.conf
/bin/cp -rf nginx.conf /usr/local/nginx/conf/
/bin/cp -rf www.conf /usr/local/nginx/conf.d/
/bin/cp -rf api.conf /usr/local/nginx/conf.d/

cat > /lib/systemd/system/nginx.service << EOF
[Unit]
Description=nginx 
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/nginx/sbin/nginx
ExecReload=/usr/local/nginx/sbin/nginx -s reload
ExecStop=/usr/local/nginx/sbin/nginx -s stop
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable nginx.service
systemctl start nginx.service

clear
echo 'nginx is now installed and running...'