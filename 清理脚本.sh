#!/system/bin/sh
#v1.0 beta
#作者:小忍 此脚本完全开源
#二改请标注原作者

# 检查 root 权限
if [ "$(id -u)" != "0" ]; then
    echo "错误：此脚本需要 Root 权限运行"
    exit 1
fi

mv -f /storage/emulated/0/清理脚本.sh /data
chmod 777 /data/清理脚本.sh
#删除空文件夹
find /storage/emulated/0/ -type d -empty -delete
#清除应用无响应日志
rm -f /data/anr/*.txt
rm -f /data/anr/traces.txt
#清除系统日志
rm -f /data/log/*.log
rm -f /data/log/*.txt
#清除崩溃报告
rm -f /data/tombstones/*
#清除低内存日志
rm -f /data/system/lowmemorykiller*.log
#清除内核日志
dmesg -c > /dev/null
echo 3 > /proc/sys/vm/drop_caches
#清除运行日志
logcat -c
#清除无用文件和文件夹
rm -rf /storage/emulated/0/.nomedia*
rm -rf /storage/emulated/0/tencent
rm -rf /storage/emulated/0/.temp*
rm -rf /storage/emulated/0/.aaa
rm -rf /storage/emulated/0/.bbb
rm -rf /storage/emulated/0/.ccc
rm -rf /storage/emulated/0/.SLOGAN
rm -rf /storage/emulated/0/backups
rm -rf /storage/emulated/0/com.jifen.ac
#清除系统缓存
rm -rf /data/cache
rm -rf /data/local/tmp
rm -rf /data/dalvik-cache
rm -rf /data/system/dropbox
rm -rf /cache
#清理软件缓存
#wx
rm -rf /data/data/com.tencent.mm/cache
rm -rf /data/data/com.tencent.mm/app_brand
rm -rf /data/media/0/Android/data/com.tencent.mm/cache
#qq
rm -rf /data/data/com.tencent.mobileqq/cache
rm -rf /data/data/com.tencent.mobileqq/app_qrcode
rm -rf /data/media/0/Android/data/com.tencent.mobileqq/cache
#ks
rm -rf /data/data/com.kuaishou.nebula/cache
rm -rf /data/media/0/Android/data/com.smile.gifmaker/cache
#tg
rm -rf /data/data/org.telegram.messenger.web/cache
rm -rf /storage/emulated/0/Android/data/org.telegram.messenger.web/cache

mv -f /data/清理脚本.sh /storage/emulated/0/
echo 清理完成😋
echo 😔红线划过深藏轮回的秘密
echo 😭我挥霍运气
echo 💔因为你才让我背对命运不害怕


# 获取内核版本
kernel_version=$(uname -r)
# 获取内存信息（转换为GB）
mem_total_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_total_gb=$(echo "scale=2; $mem_total_kb / 1048576" | bc)
# 获取交换分区信息（转换为GB）
swap_total_kb=$(grep SwapTotal /proc/meminfo | awk '{print $2}')
if [ "$swap_total_kb" -gt 0 ]; then
    swap_total_gb=$(echo "scale=2; $swap_total_kb / 1048576" | bc)
else
    swap_total_gb="0.00 (未启用)"
fi

# 格式化输出
echo "==================== 系统信息 ===================="
printf "%-15s : %s\n" "内核版本" "$kernel_version"
printf "%-15s : %.2f GB\n" "内存总量" "$mem_total_gb"
printf "%-15s : %s GB\n" "交换分区" "$swap_total_gb"
echo "=================================================="

