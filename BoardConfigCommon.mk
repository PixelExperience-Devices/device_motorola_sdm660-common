#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

PLATFORM_PATH := device/motorola/sdm660-common

TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/include

BOARD_VENDOR := motorola

# Platform
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a73
ARCH_ARM_HAVE_TLS_REGISTER := true

BOARD_USES_QCOM_HARDWARE := true
TARGET_BOOTLOADER_BOARD_NAME := SDM660
TARGET_BOARD_PLATFORM := sdm660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno508
TARGET_HAS_NO_SELECT_BUTTON := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true
TARGET_USES_64_BIT_BINDER := true

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Audio
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
USE_XML_AUDIO_POLICY_CONF := 1
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_BTNV := true

# Boot Animtion
TARGET_BOOTANIMATION_HALF_RES := true

# Camera
USE_CAMERA_STUB := true
TARGET_USES_QTI_CAMERA_DEVICE := true

# Charger
WITH_LINEAGE_CHARGER := false

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_USES_ION := true
TARGET_USES_HWC2 := true
TARGET_USES_GRALLOC1 := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Enable dexpreopt to speed boot time
ifeq ($(HOST_OS),linux)
    ifneq ($(TARGET_BUILD_VARIANT),eng)
        ifeq ($(WITH_DEXPREOPT),)
            WITH_DEXPREOPT := true
        endif
    endif
endif

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
LOC_HIDL_VERSION := 3.0

# HIDL
DEVICE_MANIFEST_FILE := $(PLATFORM_PATH)/manifest.xml
ifdef BOARD_USES_KEYMASTER_4
    DEVICE_MANIFEST_FILE += $(PLATFORM_PATH)/keymaster_4.xml
else
    DEVICE_MANIFEST_FILE += $(PLATFORM_PATH)/keymaster_3.xml
endif
DEVICE_MATRIX_FILE := $(PLATFORM_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := $(PLATFORM_PATH)/framework_manifest.xml
TARGET_FS_CONFIG_GEN += \
    $(PLATFORM_PATH)/config.fs \
    $(PLATFORM_PATH)/mot_aids.fs

# Init
TARGET_INIT_VENDOR_LIB := //$(PLATFORM_PATH):libinit_sdm660
TARGET_RECOVERY_DEVICE_MODULES := libinit_sdm660

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=2048 androidboot.configfs=true
BOARD_KERNEL_CMDLINE += sched_enable_hmp=1 sched_enable_power_aware=1
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a800000.dwc3
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.veritymode=eio
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := r353983c
TARGET_KERNEL_SOURCE := kernel/motorola/msm8998

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 0x40000
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_EXFAT_DRIVER := exfat
TARGET_NO_RECOVERY := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Power
TARGET_USES_INTERACTION_BOOST := true

# RIL
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true
TARGET_USES_OLD_MNC_FORMAT := true
CUSTOM_APNS_FILE := $(PLATFORM_PATH)/configs/sprint_apns.xml
ODM_MANIFEST_SKUS += qcril
ODM_MANIFEST_QCRIL_FILES := $(PLATFORM_PATH)/odm_manifest_qcril.xml

# Root
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist

# Vendor Security Patch Level
VENDOR_SECURITY_PATCH := 2020-10-01

# SELinux
include device/qcom/sepolicy-legacy-um/SEPolicy.mk
BOARD_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/vendor
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(PLATFORM_PATH)/sepolicy/private

# Timeservice
BOARD_USES_QC_TIME_SERVICES := true

# Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
BOARD_VNDK_VERSION := current
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Verified Boot
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_OPERSTATE_PATH := "/sys/class/net/wlan0/operstate"
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
PRODUCT_VENDOR_MOVE_ENABLED := true
