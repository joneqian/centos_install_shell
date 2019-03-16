#!/bin/bash

# install nginx

clear
echo 'We are going to install redis for you... '
yum install -y tcl gcc-c++

clear
echo 'downding redis....'
wget http://download.redis.io/releases/redis-4.0.10.tar.gz
tar zxvf redis-4.0.10.tar.gz

clear
echo 'installing redis...'
cd redis-4.0.10
make
make test
make install

clear
echo " Edit redis.conf as follows:"
echo " 1: ... daemonize yes"
echo " 2: ... bind 127.0.0.1"
echo " 3: ... loglevel notice"
echo " 4: ... logfile /var/log/redis.log"
echo "*****************************************"
/bin/cp -rf redis.conf /etc/
sed -e "s/^daemonize no$/daemonize yes/" -e "s/^# bind 127.0.0.1$/bind 127.0.0.1/" -e "s/^loglevel verbose$/loglevel notice/" -e "s/^logfile stdout$/logfile \/var\/log\/redis.log/" redis.conf > /etc/redis.conf

cat > /etc/systemd/system/redis-server.service << EOF
[Unit]
Description=The redis-server Process Manager
After=syslog.target network.target

[Service]
Type=forking
PIDFile=/var/run/redis_6379.pid
ExecStart=/usr/local/bin/redis-server /etc/redis.conf
ExecReload=/bin/kill -USR2 $MAINPID
ExecStop=/bin/kill -SIGINT $MAINPID

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start redis-server.service
systemctl enable redis-server.service

clear
echo 'redis is now installed and running...'