# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := Edison_3_mini

# Platform
TARGET_BOARD_PLATFORM := baytrail

# Architecture
TARGET_ARCH := x86
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := x86-atom
TARGET_ARCH_VARIANT_FPU := sse
TARGET_CPU_VARIANT := x86

# Kernel
TARGET_PREBUILT_KERNEL := device/bq/edison3mini/kernel
BOARD_KERNEL_CMDLINE := loglevel=0 androidboot.bootmedia=sdcard androidboot.hardware=bq_edison3_mini watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789 oops=panic panic=40 vmalloc=172M slub_max_order=2 vga=current i915.modeset=1 drm.vblankoffdelay=1 acpi_backlight=vendor
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --dt device/bq/edison3mini/dt.img --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_CUSTOM_BOOTIMG_MK := device/bq/edison3mini/mkbootimg.mk

# USB Mounting
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/f_mass_storage/lun/file

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# TWRP-Specific
TARGET_RECOVERY_FSTAB := device/bq/edison3mini/recovery/etc/twrp.fstab
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
# Our parted binary is armv7 only so disable partitioning since it won't work anyway
BOARD_HAS_NO_REAL_SDCARD := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/class/backlight/intel_backlight/brightness
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/dollar_cove_battery
# We don't currently have SuperSU binaries for x86, need to correct this at some point
TW_EXCLUDE_SUPERSU := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_SUPPRESS_SECURE_ERASE := true

