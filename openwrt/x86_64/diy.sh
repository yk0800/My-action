#!/bin/bash
# 本脚本工作目录必须是git clone的主目录
# x86_64

# Add Luci-theme
packages_path=package/openwrt-packages
mkdir -p $packages_path

git clone https://github.com/openwrt-develop/luci-theme-atmaterial $packages_path/luci-theme-atmaterial

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168/10.0/g' package/base-files/files/bin/config_generate
