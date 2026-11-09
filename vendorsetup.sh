#!/bin/bash
# Copyright (C) 2026 AERA Recovery Project contributors
# SPDX-License-Identifier: Apache-2.0

# Source explicitly from the AERA source root before lunch. Also works when
# envsetup discovers this file at device/xiaomi/munch/vendorsetup.sh.
if [ "${1:-}" = munch ] || [ "${AERA_BUILD_DEVICE:-}" = munch ] ||
   [[ "${BASH_SOURCE[0]}" == */munch/vendorsetup.sh ]]; then
    export LC_ALL=C
    export AERA_BUILD_DEVICE=munch
    export AERA_PRODUCT_PREFIX=AERA
    export AERA_BUILD_STATUS=Unofficial
    export AERA_BUILD_TYPE=Alpha
    export AERA_VIRTUAL_AB_DEVICE=1
    export AERA_RECOVERY_SYSTEM_PARTITION=/dev/block/mapper/system
    export AERA_RECOVERY_VENDOR_PARTITION=/dev/block/mapper/vendor
    export TARGET_DEVICE_ALT="munch,munchin"
    export AERA_TARGET_DEVICES="$TARGET_DEVICE_ALT"

    export AERA_USE_UPDATED_MAGISKBOOT=1
    export AERA_USE_BUSYBOX_BINARY=1
    export AERA_USE_GREP_BINARY=1
    export AERA_USE_SED_BINARY=1
    export AERA_USE_TAR_BINARY=1
    export AERA_USE_XZ_UTILS=1
    export AERA_USE_ZSTD_BINARY=1
    export AERA_USE_FSCK_EROFS_BINARY=1
    export AERA_DELETE_AROMAFM=1
    export AERA_DELETE_MAGISK_ADDON=1
    export AERA_ENABLE_ROOT_MANAGER=0
    export AERA_SETTINGS_ROOT_DIRECTORY=/data/recovery
    export AERA_MISCELLANEOUS_ROOT_DIRECTORY=/sdcard
fi
