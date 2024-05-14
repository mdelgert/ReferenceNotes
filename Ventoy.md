# Unable to update BIOS on XPS 7390 with secure boot enabled
https://github.com/fwupd/firmware-dell/issues/18
https://www.reddit.com/r/Ventoy/comments/1bn1tky/ventoy_usb_doesnt_boot_getting_weird_error/
https://github.com/ventoy/Ventoy/issues/2692

# This might be all that is necessary testing now
```bash
# Create a mountpoint and mount the partition
sudo mkdir /media/$USER/VENTOYEFI
sudo mount /dev/sda2 /media/$USER/VENTOYEFI
cd /media/$USER/VENTOYEFI/EFI/BOOT
sudo cp grub.efi grubx64.efi
```

```bash
# Create a mountpoint and mount the partition
sudo mkdir /media/$USER/VENTOYEFI && mount /dev/sda2 /media/$USER/VENTOYEFI
# Copy shim files from existing Ubuntu 24.04 install to the flash drive
sudo cp /boot/efi/EFI/BOOT/BOOTX64.efi /media/$USER/VENTOYEFI/EFI/BOOT/BOOTX64.efi
sudo cp /boot/efi/EFI/BOOT/mmx64.efi /media/$USER/VENTOYEFI/EFI/BOOT/mmx64.efi
sudo cp /boot/efi/EFI/BOOT/grub.efi /media/$USER/VENTOYEFI/EFI/BOOT/grubx64.efi
```