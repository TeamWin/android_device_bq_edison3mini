DEVICE_FOLDER := device/bq/edison3mini/


$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo ------ Creating ramdisk ------
	rm -f $(TARGET_RECOVERY_ROOT_OUT)/init
	cp $(DEVICE_FOLDER)/recovery/init $(TARGET_RECOVERY_ROOT_OUT)/init
	rm -f $(TARGET_RECOVERY_ROOT_OUT)/charger
	cp $(DEVICE_FOLDER)/recovery/charger $(TARGET_RECOVERY_ROOT_OUT)/charger
	rm -f $(TARGET_RECOVERY_ROOT_OUT)/init.rc
	cp $(DEVICE_FOLDER)/recovery/init.rc $(TARGET_RECOVERY_ROOT_OUT)/init.rc
	cp $(DEVICE_FOLDER)/recovery/init.watchdog.rc $(TARGET_RECOVERY_ROOT_OUT)/init.watchdog.rc
	rm -f $(TARGET_RECOVERY_ROOT_OUT)/ueventd.rc
	cp $(DEVICE_FOLDER)/recovery/ueventd.rc $(TARGET_RECOVERY_ROOT_OUT)/ueventd.rc
	rm -f $(TARGET_RECOVERY_ROOT_OUT)/sbin/adbd
	cp $(DEVICE_FOLDER)/recovery/sbin/adbd $(TARGET_RECOVERY_ROOT_OUT)/sbin/adbd
	rm -f $(TARGET_RECOVERY_ROOT_OUT)/sbin/healthd
	cp $(DEVICE_FOLDER)/recovery/sbin/healthd $(TARGET_RECOVERY_ROOT_OUT)/sbin/healthd
	chmod 644 $(TARGET_RECOVERY_ROOT_OUT)/default.prop
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/init
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/charger
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/sbin/adbd
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/sbin/healthd
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/sbin/intel_fw_props
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/sbin/partlink
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/sbin/thermald
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/sbin/uefivar
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/init.rc
	chmod 644 $(TARGET_RECOVERY_ROOT_OUT)/init.recovery.bq_edison3_mini.rc
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/init.watchdog.rc
	chmod 750 $(TARGET_RECOVERY_ROOT_OUT)/init.watchdog.sh
	chmod 644 $(TARGET_RECOVERY_ROOT_OUT)/ueventd.bq_edison3_mini.rc
	chmod 644 $(TARGET_RECOVERY_ROOT_OUT)/ueventd.rc


	(cd $(TARGET_RECOVERY_ROOT_OUT) && find * | sort | cpio -o -H newc) | gzip > $(recovery_ramdisk)
	@echo ------ Making recovery image ------
	$(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	@echo ------ Made recovery image ------ $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)


$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
