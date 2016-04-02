#!/system/bin/sh
busybox printf "目前的充電電流：$((-($(cat /sys/class/power_supply/battery/current_now)) / 1000)) 毫安培。\n"
exit 0
