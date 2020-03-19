#!/bin/bash
# 本脚本工作目录必须是git clone的主目录
# Raspberry

packages_path=package/openwrt-packages
mkdir -p $packages_path

git clone https://github.com/openwrt-develop/luci-theme-atmaterial $packages_path/luci-theme-atmaterial
git clone https://github.com/frainzy1477/luci-app-clash $packages_path/luci-app-clash
git clone https://github.com/vernesong/OpenClash $packages_path/OpenClash
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  $packages_path/luci-theme-argon

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168/10.0/g' package/base-files/files/bin/config_generate

# Add some default settings
#\cp -rf ../lede/zzz-default-settings package/lean/default-settings/files/zzz-default-settings
curl -fsSL https://raw.githubusercontent.com/1orz/My-action/master/lean-lede/rpi/zzz-default-settings > package/lean/default-settings/files/zzz-default-settings
