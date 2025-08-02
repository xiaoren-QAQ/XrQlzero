#!/system/bin/sh
#v1.0 beta
#作者:小忍 此脚本完全开源
#QQ:1586583684
#二改请标注原作者

# 检查 root 权限
if [ "$(id -u)" != "0" ]; then
    echo "错误：此脚本需要 Root 权限运行"
    exit 1
fi

setenforce 0
echo 清理时间较长,请耐心等待
echo 此脚本经过测试,完全安全
echo 祝屏幕前的你天天开心😁
sleep 3
mv -f /storage/emulated/0/清理脚本.sh /data
chmod 777 /data/清理脚本.sh

printf "是否要清理下载目录? [y/N] "
read choice
case $choice in
    y|Y|yes|YES)
        echo "清理中..."
        rm -rf /storage/emulated/0/Documents
        rm -rf /storage/emulated/0/Download
        ;;
    *)
        echo "操作已取消"
        ;;
esac
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
#清理临时文件
find /data/data -type f \( -name "*.tmp" -o -name "*.temp" -o -name "*.cache" \) -delete 2>/dev/null
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
rm -rf /storage/emulated/0/baidu
#清除系统缓存
rm -rf /data/cache
rm -rf /data/local/tmp
rm -rf /data/dalvik-cache
rm -rf /data/system/dropbox
rm -rf /cache
#清理软件缓存
#微信清理
WECHAT_PKG="com.tencent.mm"
#清理缓存目录
rm -rf /data/data/$WECHAT_PKG/cache/* 2>/dev/null
rm -rf /data/data/$WECHAT_PKG/app_cache/* 2>/dev/null
rm -rf /data/data/$WECHAT_PKG/app_brand/* 2>/dev/null
#清理临时文件和日志
find /data/data/$WECHAT_PKG/ -type f -name "*.log" -delete 2>/dev/null
find /data/data/$WECHAT_PKG/ -type d -name "xlog" -exec rm -rf {} + 2>/dev/null
find /data/data/$WECHAT_PKG/ -type d -name "recovery" -exec rm -rf {} + 2>/dev/null
#清理图片缩略图缓存
find /data/data/$WECHAT_PKG/MicroMsg/ -type f -name "*.thumb" -delete 2>/dev/null
#清理过期状态和缓存
rm -rf /data/data/$WECHAT_PKG/files/sticker/recent_tips 2>/dev/null
rm -rf /data/data/$WECHAT_PKG/files/location_cache/* 2>/dev/null
#清理小程序垃圾
rm -rf /data/data/$WECHAT_PKG/app_brand/_cache_/code_cache/* 2>/dev/null
rm -rf /data/data/$WECHAT_PKG/app_brand/_cache_/tmp/* 2>/dev/null
echo "✅ 微信深度清理完成"
sleep 2
#QQ清理
QQ_PKG="com.tencent.mobileqq"
#缓存目录清理
rm -rf /data/data/"$QQ_PKG"/cache/* 2>/dev/null
rm -rf /data/data/"$QQ_PKG"/app_cache/* 2>/dev/null
rm -rf /data/media/0/Android/data/"$QQ_PKG"/cache/* 2>/dev/null
#媒体缓存清理
find /data/media/0/Android/data/"$QQ_PKG"/files/ -type f \
        \( -name "QQ_Images*.tmp" -o -name "QQ_Video*.cache" -o -name "thumb_*.jpg" \) \
        -delete 2>/dev/null
#清理过期数据
find /data/data/"$QQ_PKG"/databases/ -type f \
        -name "cache_*.db" -mtime +30 -delete 2>/dev/null
#广告缓存清理
rm -rf /data/data/"$QQ_PKG"/files/ad/* 2>/dev/null
rm -rf /data/media/0/Android/data/"$QQ_PKG"/files/ad_cache/ 2>/dev/null
#QQ空间专项清理
find /data/media/0/qq_images/ -type f \
        \( -name "temp_*" -o -name "qzone_tmp_*" \) -delete 2>/dev/null 
echo "✅ QQ深度清理完成"
sleep 2
#快手清理
KS_PKG="com.kuaishou.nebula"
#清理缓存目录
rm -rf /data/data/"$KS_PKG"/cache/* 2>/dev/null
rm -rf /data/data/"$KS_PKG"/app_cache/* 2>/dev/null
rm -rf /data/data/"$KS_PKG"/files/kscache/* 2>/dev/null
#清理临时文件
find /data/data/"$KS_PKG"/ -type d -name "xlog" -exec rm -rf {} + 2>/dev/null
#清理缩略图缓存
find /data/data/"$KS_PKG"/files/ -type f -name "*.thumb" -delete 2>/dev/null
find /data/media/0/Android/data/"$KS_PKG"/files/image_cache/ -type f -delete 2>/dev/null
#清理过期日志
find /data/data/"$KS_PKG"/files/logs/ -type f -mtime +7 -delete 2>/dev/null
#清理广告缓存
rm -rf /data/media/0/Android/data/"$KS_PKG"/cache/ad/ 2>/dev/null
#清理小程序垃圾
find /data/data/"$KS_PKG"/app_mini/ -maxdepth 1 -type d -mtime +3 -exec rm -rf {} + 2>/dev/null
echo "✅ 快手清理完成"

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

setenforce 1
printf "是否要重启?(建议重启) [y/N] "
read choice
case $choice in
    y|Y|yes|YES)
        echo "系统将在5秒后重启..."
        sleep 5
        reboot
        ;;
    *)
        echo "操作已取消"
        exit 0
        ;;
esac