#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:102760448:120d49cc4e4e36525a09c46de5016b5086b02f26; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/spmfw:11632:244f0d2da1d66626483210a66abcccd97a64a15c \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:102760448:120d49cc4e4e36525a09c46de5016b5086b02f26 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
