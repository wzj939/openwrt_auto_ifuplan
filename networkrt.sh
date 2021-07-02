#!/bin/sh
tries=0
echo --- my_watchdog start ---
while [[ $tries -lt 3 ]]
do
        if /bin/ping -c 1 github.com >/dev/null
        then
            echo --- exit ---
            exit 0
        fi
        tries=$((tries+1))
        sleep 3
done

/etc/init.d/network restart #(改成ifup lan，重启lan口） (改成ifup wan，重启wan口）
#openwrt计划任务中添加*/1 * * * * sh /root/networkrt.sh，每1分钟执行1次任务。
