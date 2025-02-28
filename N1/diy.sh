#!/bin/bash

# Default IP
# 文件中每一个出现 192.168.1.1 的地方都会被替换为 192.168.5.5
sed -i 's/192.168.1.1/192.168.5.5/g' package/base-files/files/bin/config_generate

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 package/amlogic
git clone https://github.com/xiaorouji/openwrt-passwall --depth=1 package/passwall

# Update packages
cp -fr package/amlogic/luci-app-amlogic package/passwall/luci-app-passwall feeds/luci/applications/

# Clean packages
rm -rf package/amlogic package/passwall
