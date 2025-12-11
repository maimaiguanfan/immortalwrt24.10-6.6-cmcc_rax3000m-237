#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#拉取istore界面和ddnsto
rm -rf package/istore/
mkdir package/istore/
git clone https://github.com/linkease/istore.git package/istore/luci-app-store --depth=1
git clone https://github.com/linkease/nas-packages.git ../nas-packages --depth=1
git clone https://github.com/linkease/nas-packages-luci.git ../nas-packages-luci --depth=1
cp -r ../nas-packages/network/services/quickstart package/istore/
cp -r ../nas-packages/network/services/ddnsto package/istore/
cp -r ../nas-packages-luci/luci/luci-app-quickstart package/istore/
cp -r ../nas-packages-luci/luci/luci-app-ddnsto package/istore/

#拉取lucky
rm -rf package/lucky/
mkdir package/lucky/
git clone https://github.com/gdy666/luci-app-lucky.git package/lucky/ --depth=1

#拉取wake on lan plus
git clone https://github.com/animegasan/luci-app-wolplus.git package/luci-app-wolplus --depth=1

#单独拉取vernesong版OpenClash
rm -rf feeds/luci/applications/luci-app-openclash/
git clone https://github.com/vernesong/OpenClash.git feeds/luci/applications/luci-app-openclash --depth=1

#单独拉取scutclient
rm -rf feeds/luci/applications/luci-app-scutclient/
git clone https://github.com/maimaiguanfan/luci-app-scutclient.git feeds/luci/applications/luci-app-scutclient --depth=1

#单独拉取联通加速
mkdir package/scut-unicom
wget https://raw.githubusercontent.com/wykdg/route_script/master/scut-unicom/Makefile -O package/scut-unicom/Makefile

#拉取easytier
rm -rf package/luci-app-easytier
mkdir package/luci-app-easytier
git clone https://github.com/EasyTier/luci-app-easytier.git package/luci-app-easytier --depth=1

