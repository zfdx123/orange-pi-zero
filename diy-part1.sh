#!/bin/bash

mkdir package/myapp

cp -rf $GITHUB_WORKSPACE/package/xradio package/myapp/xradio

cp -rf $GITHUB_WORKSPACE/kernelPatch/001-fix-wifi-xr819.patch target/linux/sunxi/patches-5.10/

git clone --depth=1 https://github.com/kenzok78/luci-app-adguardhome package/myapp/luci-app-adguardhome
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/myapp/luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-app-argon-config package/myapp/luci-app-argon-config

echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"