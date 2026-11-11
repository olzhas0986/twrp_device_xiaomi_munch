# SPDX-License-Identifier: GPL-3.0-or-later
# AERA Recovery bring-up for Redmi K40S / POCO F4.

# Keep the UI and packaging build types consistent with vendorsetup.sh.
# Stable enables advanced security, which is unsuitable for bring-up logging.
AERA_BUILD_TYPE := Beta
AERA_BUILD_STATUS := Unofficial
AERA_TARGET_DEVICES := munch,munchin
AERA_FORCE_PREBUILT_KERNEL := 1
AERA_DYNAMIC_FULL_SIZE := $(BOARD_SUPER_PARTITION_SIZE)
# munch has recovery in boot; it has no dedicated recovery partition.
AERA_USE_AIDL_BOOT_CONTROL := 0

# 1080x2400 panel, 20:9. AERA's adaptive canvas uses a 1080-wide basis.
AERA_UI_ADAPTIVE_RESOLUTION := true
AERA_SCREEN_H := 2400
AERA_STATUS_H := 115
AERA_STATUS_INDENT_LEFT := 56
AERA_STATUS_INDENT_RIGHT := 48
AERA_HIDE_NOTCH := 1
AERA_CLOCK_POS := 1
AERA_THEME := portrait_hdpi
AERA_FRAMERATE := 120
AERA_DEFAULT_BRIGHTNESS := 500
AERA_MAX_BRIGHTNESS := 2047
AERA_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
AERA_NO_SCREEN_BLANK := true
AERA_INPUT_BLACKLIST := "hbtp_vm"

# Retain the working USB, storage, haptics and recovery tools configuration.
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
AERA_EXCLUDE_DEFAULT_USB_INIT := true
AERA_EXTRA_LANGUAGES := true
AERA_DEFAULT_LANGUAGE := en
TARGET_USES_MKE2FS := true
AERA_USE_TOOLBOX := true
AERA_INCLUDE_NTFS_3G := true
AERA_INCLUDE_REPACKTOOLS := true
AERA_INCLUDE_RESETPROP := true
AERA_EXCLUDE_APEX := true
AERA_SUPPORT_INPUT_AIDL_HAPTICS := true
AERA_INCLUDE_PYTHON := true
AERA_ENABLE_WLAN := 1

# Logs for first boot and decryption diagnosis.
AERA_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd strace tombstoned
RECOVERY_BINARY_SOURCE_FILES += \
    $(TARGET_OUT_EXECUTABLES)/debuggerd \
    $(TARGET_OUT_EXECUTABLES)/strace \
    $(TARGET_OUT_EXECUTABLES)/tombstoned
