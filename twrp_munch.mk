#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from munch device
$(call inherit-product, device/xiaomi/munch/device.mk)

PRODUCT_DEVICE := munch
PRODUCT_NAME := twrp_munch
PRODUCT_BRAND := POCO
PRODUCT_MODEL := POCO F4
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="twrp_munch-eng 99.87.36 SP2A.220405.004 eng.kdyrol.20261105.210300 test-keys"

BUILD_FINGERPRINT := POCO/twrp_munch/munch:99.87.36/SP2A.220405.004/kdyrolzhas11052105:eng/test-keys
