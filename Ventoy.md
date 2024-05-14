# Unable to update BIOS on XPS 7390 with secure boot enabled
https://github.com/fwupd/firmware-dell/issues/18
https://www.reddit.com/r/Ventoy/comments/1bn1tky/ventoy_usb_doesnt_boot_getting_weird_error/
https://github.com/ventoy/Ventoy/issues/2692

```bash
# Create a mountpoint and mount the partition
sudo mkdir /media/$USER/VENTOYEFI && mount /sda2 /media/$USER/VENTOYEFI
# Copy shim files from existing Ubuntu 24.04 install to the flash drive
sudo cp /boot/efi/EFI/BOOT/BOOTX64.efi /media/$USER/VENTOYEFI/EFI/BOOT/BOOTX64.efi
sudo cp /boot/efi/EFI/BOOT/mmx64.efi /media/$USER/VENTOYEFI/EFI/BOOT/mmx64.efi
sudo mv /boot/efi/EFI/BOOT/grub.efi /media/$USER/VENTOYEFI/EFI/BOOT/grubx64.efi
```

# Not verified if old grub should be deleted may need to run need to test and confirm on multiple computers
```bash
sudo rm /media/$USER/VENTOYEFI/EFI/BOOT/grub.efi
```