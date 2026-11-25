#!/bin/bash
START_VERSION=232
SYSTEM_CONFIG="files/etc/config/system"
DEVICE_NAME="SWITCHNEXX"
NEW_VER=$((START_VERSION + 1))
sed -i "s/^START_VERSION=[0-9]*/START_VERSION=$NEW_VER/" "$0"
FINAL_HOSTNAME="${DEVICE_NAME}_V${NEW_VER}"
if [ -f "$SYSTEM_CONFIG" ]; then
    sed -i "/^[[:space:]]*option hostname /c\    option hostname '$FINAL_HOSTNAME'" "$SYSTEM_CONFIG"
else
    echo "⚠️  未找到 $SYSTEM_CONFIG，创建默认配置..."
    mkdir -p files/etc/config
    cat > "$SYSTEM_CONFIG" << EOF
config system
    option hostname '$FINAL_HOSTNAME'
    option timezone 'UTC'
    option log_level '5'
    option ttylogin '0'
    option log_size '128'
    option urandom_seed '0'
    option compat_version '1.0'
EOF
fi
echo -e "\n========================================"
echo "  本次编译的hostname: $FINAL_HOSTNAME"
echo -e "========================================\n"

# .gitignore 文件内容
# package/luci-app-tbmqtt
# package/utils/thingsboard-mqtt
# sha256sums
# CLAUDE.md
# .deepseek/
# target/linux/ramips/mt76x8/config-6.12
# target/linux/ramips/mt7620/config-6.12
# target/linux/ramips/mt7621/config-6.12
# target/linux/ramips/rt288x/config-6.12
# target/linux/ramips/rt305x/config-6.12
# target/linux/ramips/rt3883/config-6.12
# rm package/base-files/files/etc/banner*
# rm package/base-files/files/etc/profile.d/apk-cheatsheet.sh
# package/base-files/Makefile 删除 $(1)/etc/banner
# cp scripts/fix-ncurses-makefiles.sh ~/baiduyunpansync/
# cp package/libs/ncurses/Makefile ~/baiduyunpansync/openwrt-ncurses-Makefile
cp -rf --parents package/luci-app-tbmqtt ~/baiduyunpansync/xnopenwrtiot
cp -rf --parents package/utils/thingsboard-mqtt ~/baiduyunpansync/xnopenwrtiot
cp -rf --parents package/base-files/files/lib/preinit/30_failsafe_wait ~/baiduyunpansync/xnopenwrtiot
cp -rf --parents target/linux/ramips/dts/mt7628an_hilink_hlk-7628n.dts ~/baiduyunpansync/xnopenwrtiot
cp -rf --parents target/linux/generic/pending-6.12/783* ~/baiduyunpansync/xnopenwrtiot
cp -rf --parents target/linux/generic/pending-6.12/925* ~/baiduyunpansync/xnopenwrtiot
cp -rf --parents scripts/getver.sh ~/baiduyunpansync/xnopenwrtiot
cp -rf --parents files ~/baiduyunpansync/xnopenwrtiot
cp -rf --parents auto_version.sh ~/baiduyunpansync/xnopenwrtiot
cp -rf --parents CLAUDE.md ~/baiduyunpansync/xnopenwrtiot
