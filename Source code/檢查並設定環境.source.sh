# 此 script 只應被 sourced 進其他 script 中，不應被執行
UTILITY_PROVIDER=""

# 檢查是否有 printf 命令，如果沒有檢查是否有支援它的類 busybox 軟體存在
which printf 2>&1 >/dev/null
if [ $? -ne 0 ]; then # printf command not found
	provider_found="false"

	# find an alternative
	for provider in busybox toybox; do
		which ${provider}
		if [ $? -eq 0 ]; then # provider found
			UTILITY_PROVIDER="${provider}"
			provider_found="true"
			break
		fi
	done

	if [ $provider_found = "false" ]; then
		echo "錯誤：找不到可用的 printf 命令，本軟體將無法繼續運行。"
		exit 1
	fi
fi
