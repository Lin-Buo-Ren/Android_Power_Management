#!/system/bin/sh
# idea from http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
readonly PROGRAM_NAME="$(basename $0)"
readonly PROGRAM_DIRECTORY="$(dirname $0)"
readonly PROGRAM_ARGUMENT_ORIGINAL_LIST="$@"
readonly PROGRAM_ARGUMENT_ORIGINAL_NUMBER=$#

main(){
	source "${PROGRAM_DIRECTORY}/檢查並設定環境.source.sh"
	${UTILITY_PROVIDER} printf "目前的充電電流：$((-($(cat /sys/class/power_supply/battery/current_now)) / 1000)) 毫安培。\n"
	exit 0
}
main

