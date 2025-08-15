#!/system/bin/sh
#v1.5 
#作者:小忍 此脚本完全开源
#QQ:1586583684
#二改请标注原作者

# 检查 root 权限
if [ "$(id -u)" != "0" ]; then
    echo "错误：此脚本需要 Root 权限运行"
    exit 1
fi

echo ""
    echo -e "    \033[1;31m\   /\   /  \ /  \   /  \ /  \   /  \ /  \   /  \ /  \033[0m"
    echo -e "     \033[1;32m\ /  \ /    X    \ /    X    \ /    X    \ /    X   \033[0m"
    echo -e "      \033[1;33mX    X    / \    X    / \    X    / \    X    / \  \033[0m"
    echo -e "     \033[1;34m/ \  / \  /   \  / \  /   \  / \  /   \  / \  /   \ \033[0m"
    echo -e "    \033[1;35m/   \/   \/     \/   \/     \/   \/     \/   \/     \\\\"
    echo -e "    \033[1;36mX r Q l z e r o\033[0m"
sleep 1

echo 欢迎使用此清理脚本
echo 清理时间较长,请耐心等待
echo 此脚本经过测试,完全安全
echo 祝屏幕前的你天天开心😁
sleep 1


# 显示菜单
show_menu() {
    echo "========================================"
    echo "          XrQlzero v1.5 一键清理"
    echo "========================================"
    echo "本项目地址:https://github.com/xiaoren-QAQ/XrQlzero"
    echo " 1) 完全清理"
    echo " 2) 软件清理"
    echo " 3) 空文件夹清理"
    echo " 4) 下载目录清理"
    echo " 5) 退出"
    echo "========================================"
    echo ""
    printf "请输入选项 (1-5): "
}


#1.完全清理
option_full_clean() {
rm -rf /storage/emulated/0/Documents
rm -rf /storage/emulated/0/Download
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
rm -rf /storage/emulated/0/msc
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

#Telegram清理
TG_PKG="org.telegram.messenger"    
#缓存目录清理
rm -rf /data/data/"$TG_PKG"/cache/* 2>/dev/null
rm -rf /data/data/"$TG_PKG"/app_webview/* 2>/dev/null
rm -rf /data/media/0/Android/data/"$TG_PKG"/cache/* 2>/dev/null
#媒体缓存清理
find /data/media/0/Android/data/"$TG_PKG"/ -type f \
        \( -name "thumb_*" -o -name "*.tmp" -o -name "video_thumb*" \) \
        -delete 2>/dev/null
#清理过期缓存
find /data/data/"$TG_PKG"/files/ -type f -atime +30 -delete 2>/dev/null
#浏览器缓存清理
rm -rf /data/data/"$TG_PKG"/app_webview/GPUCache/* 2>/dev/null
rm -rf /data/data/"$TG_PKG"/app_webview/VideoCache/* 2>/dev/null
#会话缓存清理
find /data/data/"$TG_PKG"/cache/ -maxdepth 1 -type f -name "cache*" -delete 2>/dev/null
echo "✅ Telegram深度清理完成"

#抖音清理
DY_PKG="com.ss.android.ugc.aweme"
#缓存目录清理
rm -rf /data/data/"$DY_PKG"/cache/* 2>/dev/null
rm -rf /data/data/"$DY_PKG"/app_cache/* 2>/dev/null
rm -rf /data/media/0/Android/data/"$DY_PKG"/cache/* 2>/dev/null
#媒体缓存清理
find /data/media/0/Android/data/"$DY_PKG"/files/ -type f \
        \( -name "thumb_*" -o -name "video_thumb*" -o -name "image_cache*" \) \
        -delete 2>/dev/null
#清理过期数据
find /data/data/"$DY_PKG"/databases/ -type f \
        -name "cache_*.db" -mtime +30 -delete 2>/dev/null
#广告缓存清理
rm -rf /data/data/"$DY_PKG"/files/ad/* 2>/dev/null
rm -rf /data/media/0/Android/data/"$DY_PKG"/files/ad_cache/ 2>/dev/null
#特效缓存清理
find /data/data/"$DY_PKG"/files/effect/ -type f \
        \( -name "temp_*" -o -name "cache_*" \) -delete 2>/dev/null
echo "✅ 抖音深度清理完成"
}

#2.软件清理
option_app_clean() {
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

#Telegram清理
TG_PKG="org.telegram.messenger"    
#缓存目录清理
rm -rf /data/data/"$TG_PKG"/cache/* 2>/dev/null
rm -rf /data/data/"$TG_PKG"/app_webview/* 2>/dev/null
rm -rf /data/media/0/Android/data/"$TG_PKG"/cache/* 2>/dev/null
#媒体缓存清理
find /data/media/0/Android/data/"$TG_PKG"/ -type f \
        \( -name "thumb_*" -o -name "*.tmp" -o -name "video_thumb*" \) \
        -delete 2>/dev/null
#清理过期缓存
find /data/data/"$TG_PKG"/files/ -type f -atime +30 -delete 2>/dev/null
#浏览器缓存清理
rm -rf /data/data/"$TG_PKG"/app_webview/GPUCache/* 2>/dev/null
rm -rf /data/data/"$TG_PKG"/app_webview/VideoCache/* 2>/dev/null
#会话缓存清理
find /data/data/"$TG_PKG"/cache/ -maxdepth 1 -type f -name "cache*" -delete 2>/dev/null
echo "✅ Telegram深度清理完成"

#抖音清理
DY_PKG="com.ss.android.ugc.aweme"
#缓存目录清理
rm -rf /data/data/"$DY_PKG"/cache/* 2>/dev/null
rm -rf /data/data/"$DY_PKG"/app_cache/* 2>/dev/null
rm -rf /data/media/0/Android/data/"$DY_PKG"/cache/* 2>/dev/null
#媒体缓存清理
find /data/media/0/Android/data/"$DY_PKG"/files/ -type f \
        \( -name "thumb_*" -o -name "video_thumb*" -o -name "image_cache*" \) \
        -delete 2>/dev/null
#清理过期数据
find /data/data/"$DY_PKG"/databases/ -type f \
        -name "cache_*.db" -mtime +30 -delete 2>/dev/null
#广告缓存清理
rm -rf /data/data/"$DY_PKG"/files/ad/* 2>/dev/null
rm -rf /data/media/0/Android/data/"$DY_PKG"/files/ad_cache/ 2>/dev/null
#特效缓存清理
find /data/data/"$DY_PKG"/files/effect/ -type f \
        \( -name "temp_*" -o -name "cache_*" \) -delete 2>/dev/null
echo "✅ 抖音深度清理完成"
}

#3.空文件夹清理
option_empty_clean() {
find /storage/emulated/0/ -type d -empty -delete
}

#4.下载目录清理
option_download_clean() {
rm -rf /storage/emulated/0/Documents
rm -rf /storage/emulated/0/Download
echo 清理完成
}



#主循环
while true; do
    show_menu
    read choice
    
    case $choice in
        1) 
            option_full_clean 
            ;;
        2) 
            option_app_clean 
            ;;
        3) 
            option_empty_clean 
            ;;
        4) 
            option_download_clean 
            ;;
        5) 
            echo "已退出"
            exit 0 
            ;;
        *) 
            echo "无效选项，请重新输入"
            sleep 1
            ;;
    esac
    
    #显示结果
    echo ""
    echo "操作完成! 按回车键返回菜单..."
    read
done