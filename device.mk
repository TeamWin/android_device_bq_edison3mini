LOCAL_PATH := device/bq/edison3mini

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel:kernel \
    $(LOCAL_PATH)/dt.img:dt.img \
    $(LOCAL_PATH)/recovery/charger:root/charger \
    $(LOCAL_PATH)/recovery/init.rc:root/init \
    $(LOCAL_PATH)/recovery/init.rc:root/init.rc \
    $(LOCAL_PATH)/recovery/init.watchdog.rc:root/init.watchdog.rc \
    $(LOCAL_PATH)/recovery/init.watchdog.sh:root/init.watchdog.sh \
    $(LOCAL_PATH)/recovery/init.recovery.bq_edison3_mini.rc:root/init.recovery.bq_edison3_mini.rc \
    $(LOCAL_PATH)/recovery/ueventd.bq_edison3_mini.rc:root/ueventd.bq_edison3_mini.rc \
    $(LOCAL_PATH)/recovery/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/recovery/sbin/adbd:root/sbin/adbd \
    $(LOCAL_PATH)/recovery/sbin/healthd:root/sbin/healthd \
    $(LOCAL_PATH)/recovery/sbin/intel_fw_props:root/sbin/intel_fw_props \
    $(LOCAL_PATH)/recovery/sbin/partlink:root/sbin/partlink \
    $(LOCAL_PATH)/recovery/sbin/thermald:root/sbin/thermald \
    $(LOCAL_PATH)/recovery/sbin/uefivar:root/sbin/uefivar

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := edison3mini
