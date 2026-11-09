#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2021-2024 The OrangeFox Recovery Project
# Modified in 2026 by olzhas0986
# SPDX-License-Identifier: GPL-3.0-or-later
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter munch,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
