#!/bin/bash
# SPDX-License-Identifier: GPL-3.0-or-later
# Source explicitly with: source device/xiaomi/munch/vendorsetup.sh munch
# Do not change other products when envsetup sources every device's script.
case "${1:-${AERA_BUILD_DEVICE:-${TARGET_PRODUCT:-}}}" in
    munch|twrp_munch)
        export LC_ALL=C
        export AERA_BUILD_DEVICE=munch
        export AERA_PRODUCT_PREFIX=AERA
        export AERA_BUILD_STATUS=Unofficial
        export AERA_BUILD_TYPE=Beta
        export AERA_AB_DEVICE=1
        export AERA_VIRTUAL_AB_DEVICE=1
        export TARGET_DEVICE_ALT="munch,munchin"
        export AERA_TARGET_DEVICES="$TARGET_DEVICE_ALT"
        export AERA_VANILLA_BUILD=1
        export AERA_ENABLE_ROOT_MANAGER=0
        export AERA_USE_BUSYBOX_BINARY=1
        export AERA_USE_UPDATED_MAGISKBOOT=1
        export AERA_DELETE_AROMAFM=1
        export AERA_DELETE_MAGISK_ADDON=1
        export AERA_SETTINGS_ROOT_DIRECTORY=/data/recovery
        export AERA_MISCELLANEOUS_ROOT_DIRECTORY=/sdcard
        ;;
esac
