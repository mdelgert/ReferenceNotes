## Summary of Proxmox Forum Thread on Low Resolution in Virtual Machines

### Host Setup
1. **Install Guest Agent**: 
    - Install guest-agent in each VM.
    - Enable it in Proxmox VE Webinterface (GUI):
        - Navigate to Datacenter > Node > Linux VM.
        - Select Options > QEMU Guest Agent > Edit.
        - Select "Use QEMU Guest Agent" and "Run guest-trim after a disk move or VM migration".
        - Set Type to "Default (VirtIO)" and press OK.

### Linux Setup
1. **Install QEMU Guest Agent**:
    - On Debian/Ubuntu-based systems, run:
      ```sh
      apt-get install qemu-guest-agent
      ```

2. **Start and Enable Service**:
    - Start the agent:
      ```sh
      systemctl start qemu-guest-agent
      ```
    - Enable auto-start:
      ```sh
      systemctl enable qemu-guest-agent
      ```

### GRUB Configuration
1. **Edit Kernel Parameters**:
    - During system start, access the GRUB menu by holding the left Shift key.
    - Highlight the desired kernel and press `e` to edit.
    - Add `-vga virtio` to the end of the line starting with `linux`.
    - Press `Ctrl + x` to boot.

### Final Solution
1. **Set Display in Proxmox**:
    - In Proxmox VE Webinterface, go to Datacenter > Node > Linux VM.
    - Select Hardware > Display > Edit.
    - Set to "VirtIO-GPU (virtio)" and save.

For more details, refer to the [Proxmox forum thread](https://forum.proxmox.com/threads/virtual-machine-low-resolution.47179/).