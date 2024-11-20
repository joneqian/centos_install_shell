<!--
 * @Author: leyi leyi@myun.info
 * @Date: 2024-09-10 16:57:25
 * @LastEditors: leyi leyi@myun.info
 * @LastEditTime: 2024-11-20 14:48:21
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
31.13.69.169 global-ssl.fastly.net
20.205.243.166 github.com
185.199.110.153 assets-cdn.github.com
185.199.108.153 assets-cdn.github.com
185.199.111.153 assets-cdn.github.com
185.199.110.153 assets-cdn.github.com
```
