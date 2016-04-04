#!/system/bin/sh
# idea from http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
readonly PROGRAM_NAME="$(basename $0)"
readonly PROGRAM_DIRECTORY="$(dirname $0)"
readonly PROGRAM_ARGUMENT_ORIGINAL_LIST="$@"
readonly PROGRAM_ARGUMENT_ORIGINAL_NUMBER=$#

main() {
	source "${PROGRAM_DIRECTORY}/檢查並設定環境.source.sh"

	${UTILITY_PROVIDER} printf "先前的電源最大提取電流：$(($(cat /sys/class/power_supply/usb/current_max) / 1000)) mA。\n"
	${UTILITY_PROVIDER} printf "正在設定最大提取電流至 0 微安培……\n"
	su --command "echo 0 > /sys/class/power_supply/usb/current_max"
	${UTILITY_PROVIDER} printf "目前的電源最大提取電流：$(($(cat /sys/class/power_supply/usb/current_max) / 1000)) mA。\n"
	exit 0
}
main

