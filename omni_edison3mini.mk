# Inherit device configuration
$(call inherit-product, device/bq/edison3mini/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := edison3mini
PRODUCT_NAME := omni_edison3mini
PRODUCT_BRAND := bq
PRODUCT_MANUFACTURER := bq
PRODUCT_MODEL := Edison 3 mini
