<!--
 * @Author: leyi leyi@myun.info
 * @Date: 2024-09-10 16:57:25
 * @LastEditors: leyi leyi@myun.info
 * @LastEditTime: 2025-02-13 09:40:27
 * @FilePath: /centos_install_shell/github 镜像.md
 * @Description:
 *
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved.
-->

```sh
# 安装工具
yum install bind-utils
```

```sh
# 获取 IP，取 "Non-authoritative answer" 下的 IP
nslookup github.global.ssl.fastly.net
nslookup github.com
nslookup assets-cdn.github.com
```

```sh
vim /etc/hosts

# 添加如下信息
202.160.128.40 global-ssl.fastly.net
20.205.243.166 github.com
185.199.110.153 assets-cdn.github.com
185.199.108.153 assets-cdn.github.com
185.199.111.153 assets-cdn.github.com
185.199.110.153 assets-cdn.github.com
```

```sh
# 重启网络
# CentOS
systemctl restart NetworkManager

# Ubuntu
systemd-resolve --flush-caches
```
