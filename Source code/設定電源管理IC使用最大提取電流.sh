#!/system/bin/sh
busybox printf "目前的充電電流（帶負號）：`cat /sys/class/power_supply/battery/current_now` 微安培。\n"
busybox printf "先前的最大提取電流：`cat /sys/class/power_supply/usb/current_max` 微安培。 \n"

# busybox printf "請問您“
busybox printf "正在設定最大提取電流至 2000000 微安培……\n"
su --command "echo 2000000 > /sys/class/power_supply/usb/current_max"
busybox printf "目前的最大提取電流：`cat /sys/class/power_supply/usb/current_max` 微安培。 \n"

sleep 5
busybox printf "變更最大提取電流後目前的充電電流（帶負號）：`cat /sys/class/power_supply/battery/current_now` 微安培。\n"
exit 0
