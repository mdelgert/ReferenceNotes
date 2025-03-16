
---

## **1. Enable Intel VT-x in BIOS**
1. **Reboot your PC** and enter the BIOS/UEFI:
   - Press **F2, F10, DEL, or ESC** (varies by manufacturer) during boot.
2. Look for **"Intel VT-x"** or **"AMD-V"** in:
   - **Advanced CPU Configuration**
   - **Virtualization Settings**
   - **Processor Settings**
3. **Enable it** and save changes.
4. Boot back into Ubuntu.

---

## **2. Enable Virtualization Inside VMware Workstation**
Since your Windows 11 VM needs **nested virtualization** to use WSL 2, you must enable it in VMware:

### **For Existing Windows 11 VM**
1. **Shutdown the VM** (not suspend).
2. Open **VMware Workstation**.
3. Select the **Windows 11 VM** → Click **Edit Virtual Machine Settings**.
4. Go to the **Processor** tab:
   - Check ✅ **Virtualize Intel VT-x/EPT or AMD-V/RVI**.
   - Check ✅ **Virtualize CPU Performance Counters**.
5. Save and restart the VM.

### **For New Windows 11 VM**
If you're creating a new VM, select:
- **Firmware Type:** UEFI
- **Processors:** At least **4 Cores** and enable **VT-x/EPT**.

---

## **3. Enable WSL 2 Inside Windows 11 VM**
After ensuring virtualization is enabled:
1. Open **PowerShell (Admin)** inside Windows 11.
2. Run the following commands:

   ```powershell
   wsl --install
   wsl --set-default-version 2
   ```

3. Restart Windows.

---

### **4. Verify WSL 2 is Working**
After rebooting:
- Open **Command Prompt** and run:

  ```powershell
  wsl --list --verbose
  ```

- If it shows WSL 2, everything is working!

Let me know if you hit any issues. 🚀