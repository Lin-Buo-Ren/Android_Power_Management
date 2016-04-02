#!/system/bin/sh
busybox printf "先前的最大提取電流：`cat /sys/class/power_supply/usb/current_max` 微安培。 \n"
busybox printf "正在設定最大提取電流至 0 微安培……\n"
su --command "echo 0 > /sys/class/power_supply/usb/current_max"
busybox printf "目前的最大提取電流：`cat /sys/class/power_supply/usb/current_max` 微安培。 \n"
exit 0