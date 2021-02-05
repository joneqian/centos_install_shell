#!/bin/bash

#计算cpu使用率, -n number：指定在结束前应该产生的最大迭代次数或帧数,一般迭代次数越大，获取到的cpu使用率越准确; 本脚本中是迭代了5次，"-n5" 
cpu=`top -b -n5 | fgrep "Cpu(s)" | tail -1 | awk -F'id,' '{split($1, vs, ","); v=vs[length(vs)]; sub(/\s+/, "", v);sub(/\s+/, "", v); printf "%d", 100-v;}'`
echo 'cpu使用率: '$cpu'%\n'

#统计内存使用率
mem_used_persent=`free -m | awk -F '[ :]+' 'NR==2{printf "%d", ($3)/$2*100}'`
# -e参数是使 "\n"换行符生效进行输出换行的
echo -e '内存使用率: '$mem_used_persent'%\n'

#统计磁盘使用情况，df -P参数可以防止打印输出的内容换行
echo '磁盘使用率统计: '
df -THP | awk -F '[ ]+' 'NR!=1{print $1": "$6}'
