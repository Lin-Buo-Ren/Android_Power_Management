#!/system/bin/sh
busybox printf "目前的充電電流（帶負號）：`cat /sys/class/power_supply/battery/current_now` 微安培。\n"
exit 0