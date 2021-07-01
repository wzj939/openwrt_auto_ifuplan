#!/bin/sh
tries=0
echo --- my_watchdog start ---
while [[ $tries -lt 3 ]]
do
        if /bin/ping -c 1 8.8.8.8 >/dev/null
        then
            echo --- exit ---
            exit 0
        fi
        tries=$((tries+1))
        sleep 3
done

/etc/init.d/network restart
