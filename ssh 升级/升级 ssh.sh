# 安装zlilb
./configure --prefix=/usr/local/src/zlilb
make -j 4 && make test && make install


# 安装openssl
./config --prefix=/usr/local/openssl
make && make -j 4 install

ln -sf /usr/local/openssl/include/openssl /usr/include/openssl
ln -sf /usr/local/openssl/bin/openssl /usr/bin/openssl
ln -sf /usr/local/openssl/lib/libssl.so.3 /usr/lib64/libssl.so.3
ln -sf /usr/local/openssl/lib/libcrypto.so.3 /usr/lib64/libcrypto.so.3

openssl version -a

# 安装openssh
mv /etc/ssh /etc/ssh.bak

./configure --prefix=/usr/local/openssh/ --sysconfdir=/etc/ssh/ --with-ssl-dir=/usr/local/openssl/ --with-zlib=/usr/local/zlib/ --without-openssl-header-check

make -j 4 && make install

ln -sf /usr/local/openssh/sbin/sshd /sbin/sshd
ln -sf /usr/local/openssh/bin/ssh /usr/bin/ssh
ln -sf /usr/local/openssh/bin/scp /usr/bin/scp
ln -sf /usr/local/openssh/bin/sftp /usr/bin/sftp
ln -sf /usr/local/openssh/bin/ssh-add /usr/bin/ssh-add
ln -sf /usr/local/openssh/bin/ssh-keygen /usr/bin/ssh-keygen
ln -sf /usr/local/openssh/bin/ssh-keyscan /usr/bin/ssh-keyscan

cp /etc/ssh.bak/sshd_config /etc/ssh/sshd_config 

systemctl restart sshd

