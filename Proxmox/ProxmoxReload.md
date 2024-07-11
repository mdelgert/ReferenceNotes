# Clear lvm boot from ubuntu iso

```bash
sudo vgscan #Identify the LVM volumes present on your system by running the following commands
sudo lvscan
sudo lvchange -an /dev/pve/data #Deactivate any active logical volumes
sudo lvchange -an /dev/pve/swap
sudo lvchange -an /dev/pve/root
sudo lvremove /dev/pve/data #Remove the logical volumes
sudo lvremove /dev/pve/swap
sudo lvremove /dev/pve/root
sudo vgremove pve #Remove volume broup
sudo pvdisplay #Locate disk to remove from LVM
sudo pvremove /dev/nvme1n1p3 #Remove the physical volumes
sudo lsblk #List the disk name
sudo dd if=/dev/zero of=/dev/nvme1n1 bs=512 count=1 #Clear the partition table
sudo wipefs --all /dev/nvme1n1
sudo wipefs /dev/nvme1n1 #Check Filesystem Signatures with expected output no signatures are found
```
