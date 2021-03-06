#!/system/bin/sh
# 關於前一行的 shebang：實際上它是 AOSP 所使用的 shell－－MirBSD Korn shell(mksh)，特性與 GNU Bash 略為不同
# 請參閱 mksh(1) 的 manpage 使用手冊

# Defensive Bash Programming
# http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
typeset -r PROGRAM_NAME="$(basename "$0")"
typeset -r PROGRAM_DIRECTORY="$(dirname "$0")"
typeset -r PROGRAM_ARGUMENT_ORIGINAL_LIST="$@"
typeset -r PROGRAM_ARGUMENT_ORIGINAL_NUMBER=$#

# 印出軟體使用幫助訊息的子程式，無任何參數
printHelpMessage(){
	${UTILITY_PROVIDER} printf "$PROGRAM_NAME 的使用說明：\n"
	${UTILITY_PROVIDER} printf "	./$PROGRAM_NAME 〈要設定的電源最大提取電流（單位：豪安培(mA)）〉\n"
}

# 程式進入點，僅接受 input_new_current_ma 或 --help 選用參數
main(){
	source "${PROGRAM_DIRECTORY}/檢查並設定環境.source.sh"

	typeset -i10 battery_current_now_raw
	typeset -i10 usb_current_max_raw
	typeset -i10 input_new_current_ma
	
	if [ $PROGRAM_ARGUMENT_ORIGINAL_NUMBER -gt 1 ]; then
		${UTILITY_PROVIDER} printf "錯誤：命令格式錯誤！\n" 1>&2
		printHelpMessage
		exit 1
	elif [ $PROGRAM_ARGUMENT_ORIGINAL_NUMBER -eq 1 ] && [ "$PROGRAM_ARGUMENT_ORIGINAL_LIST" == "--help" ]; then
		printHelpMessage
		exit 0
	elif [ $PROGRAM_ARGUMENT_ORIGINAL_NUMBER -eq 1 ] && [ "$PROGRAM_ARGUMENT_ORIGINAL_LIST" != "--help" ]; then
		input_new_current_ma="$PROGRAM_ARGUMENT_ORIGINAL_LIST"
	else # [ $PROGRAM_ARGUMENT_ORIGINAL_NUMBER -eq 0 ], interactive/static mode
		# Android Tuner 目前不支援執行 script 的途中輸入內容
		#	${UTILITY_PROVIDER} printf "請輸入您的電源的最大輸出電流（單位：mA）（警告：輸入超過您的電源的最大輸出電流的電流量將可能造成電源過熱起火！請參閱您的電源的可輸出電流量標示）："
		#	read input_new_current_ma
		
		### Manually override profiles ###
		#input_new_current_ma=2500 # 不實際的上限
		#input_new_current_ma=2000 # 2A
		#input_new_current_ma=1000 # 1A
		#input_new_current_ma=990 # USB 3.0 上限（多 10%（測試能不能真的抽到 >= 900mA））
		input_new_current_ma=900 # USB 3.0 上限
		#input_new_current_ma=500 # USB 2.0 上限
	fi
	
	if [ input_new_current_ma = "" ]; then
		${UTILITY_PROVIDER} printf "錯誤：欲設定之最大提取電流格式錯誤！\n" 1>&2
		exit 1
	fi

	battery_current_now_raw=$(cat /sys/class/power_supply/battery/current_now)
	if [ $? -ne 0 ]; then
		${UTILITY_PROVIDER} printf "錯誤：無法讀取電池充電電流！\n" 1>&2
		exit 1
	fi
	${UTILITY_PROVIDER} printf "目前的電池充電電流：$((- $battery_current_now_raw / 1000)) mA。\n"

	usb_current_max_raw=$(cat /sys/class/power_supply/usb/current_max)
	if [ $? -ne 0 ]; then
		${UTILITY_PROVIDER} printf "錯誤：無法讀取電源最大提取電流！\n" 1>&2
		exit 1
	fi
	${UTILITY_PROVIDER} printf "先前的電源最大提取電流：$(($usb_current_max_raw / 1000)) mA。\n"

	#TODO: 檢查輸入是否格式正確
	${UTILITY_PROVIDER} printf "正在設定電源最大提取電流至 ${input_new_current_ma} mA……\n"
	su --command "echo $((input_new_current_ma * 1000)) > /sys/class/power_supply/usb/current_max"
	
	usb_current_max_raw=$(cat /sys/class/power_supply/usb/current_max)
	if [ $? -ne 0 ]; then
		${UTILITY_PROVIDER} printf "錯誤：無法讀取電源最大提取電流！\n" 1>&2
		exit 1
	fi
	${UTILITY_PROVIDER} printf "目前的電源最大提取電流：$(($usb_current_max_raw / 1000)) mA。\n"

	# 電源管理晶片電流量需要時間更新，所以等它一下
	sleep 5

	battery_current_now_raw=$(cat /sys/class/power_supply/battery/current_now)
	if [ $? -ne 0 ]; then
		${UTILITY_PROVIDER} printf "錯誤：無法讀取電池充電電流！\n" 1>&2
		exit 1
	fi
	${UTILITY_PROVIDER} printf "變更電源最大提取電流後目前的電池充電電流：$((- $battery_current_now_raw / 1000)) mA。\n"
	exit 0
}
main

