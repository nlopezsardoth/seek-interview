#!/bin/bash
# 命令数组
commands=("melos bs" "melos clean_and_build" "melos clean_project")

# 最大重试次数
MAX_RETRIES=5

# 等待时间（秒）
WAIT_TIME=2

# 初始化重试计数数组
retry_counts=(0 0)

# 追踪是否所有命令都成功
all_successful=false

while [ "$all_successful" = false ]; do
    all_successful=true
    for i in "${!commands[@]}"; do
        if [ "${retry_counts[$i]}" -lt "$MAX_RETRIES" ]; then
            ${commands[$i]}
            if [ $? -ne 0 ]; then
                retry_counts[$i]=$((retry_counts[$i] + 1))
                all_successful=false
            fi
        fi
    done
    
    if [ "$all_successful" = false ]; then
        echo "有命令失败，等待 $WAIT_TIME 秒后重试。"
        sleep $WAIT_TIME
    fi
done

echo "所有命令成功完成。"