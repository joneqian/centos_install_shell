<!--
 * @Author: leyi leyi@myun.info
 * @Date: 2024-08-15 10:16:49
 * @LastEditors: leyi leyi@myun.info
 * @LastEditTime: 2024-08-15 10:17:14
 * @FilePath: /centos_install_shell/git配置.md
 * @Description:
 *
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved.
-->

# 阿里云无法访问 git 解决方案

```sh
git config --global --unset http.proxy
git config --global --unset https.proxy

```
