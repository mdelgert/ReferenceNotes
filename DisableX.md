Disabling the X Window System (commonly referred to as "X") from starting automatically can be useful for various reasons, such as improving system performance, enhancing security, or using your system primarily through the command line. On Debian-based systems like Debian Bookworm, this typically involves configuring the system to boot into a non-graphical (multi-user) target instead of the graphical target managed by `systemd`.

Here's a comprehensive guide to disabling X from starting automatically:

## **Method 1: Change the Default systemd Target**

`systemd` uses "targets" to define different states of the system. The graphical interface is managed by the `graphical.target`, while the non-graphical interface uses the `multi-user.target`. By setting the default target to `multi-user.target`, you prevent the graphical interface from starting on boot.

### **Step 1: Check the Current Default Target**

Open a terminal and run:

```bash
systemctl get-default
```

You should see output like:

```
graphical.target
```

### **Step 2: Change the Default Target to Multi-User**

To disable the graphical interface from starting automatically, set the default target to `multi-user.target`:

```bash
sudo systemctl set-default multi-user.target
```

### **Step 3: Reboot the System**

After changing the default target, reboot your system to apply the changes:

```bash
sudo reboot
```

Upon rebooting, your system should start in a non-graphical, command-line mode.

### **Reverting the Change (Optional)**

If you decide to re-enable the graphical interface in the future, set the default target back to `graphical.target`:

```bash
sudo systemctl set-default graphical.target
sudo reboot
```

## **Method 2: Disable the Display Manager**

The display manager is responsible for launching the graphical login screen. By disabling it, you prevent X from starting. Common display managers include `gdm3`, `lightdm`, `sddm`, and `xdm`.

### **Step 1: Identify the Active Display Manager**

First, determine which display manager is currently active:

```bash
cat /etc/X11/default-display-manager
```

This command will output the path to the active display manager, such as `/usr/sbin/gdm3` or `/usr/sbin/lightdm`.

### **Step 2: Disable the Display Manager**

Once you've identified the active display manager, disable it using `systemctl`. Replace `gdm3` with your display manager's service name if different.

For **GDM3**:

```bash
sudo systemctl disable gdm3
sudo systemctl stop gdm3
```

For **LightDM**:

```bash
sudo systemctl disable lightdm
sudo systemctl stop lightdm
```

For **SDDM**:

```bash
sudo systemctl disable sddm
sudo systemctl stop sddm
```

### **Step 3: Reboot the System**

Reboot to ensure the display manager is disabled:

```bash
sudo reboot
```

Your system should now boot into a non-graphical, command-line interface.

### **Re-enabling the Display Manager (Optional)**

To re-enable the display manager, use the `enable` command instead of `disable`. For example, for `gdm3`:

```bash
sudo systemctl enable gdm3
sudo systemctl start gdm3
```

Then, reboot or start the service as needed.

## **Method 3: Remove X and Related Packages (Advanced)**

**Warning:** This method is more drastic and involves removing X and potentially other related packages from your system. Proceed only if you're certain you won't need the graphical interface and understand the dependencies.

### **Step 1: Update Package Lists**

```bash
sudo apt update
```

### **Step 2: Remove X and Related Packages**

You can remove the `xorg` package along with common desktop environments. For example, to remove X.Org and GNOME:

```bash
sudo apt remove --purge xorg gnome-shell
```

To ensure all related packages are removed, you might need to remove additional desktop environment packages like `kde`, `xfce`, etc., depending on what's installed.

### **Step 3: Autoremove Unnecessary Packages**

After removal, clean up any residual dependencies:

```bash
sudo apt autoremove
```

### **Step 4: Reboot the System**

```bash
sudo reboot
```

Your system should now boot into a pure command-line interface without X installed.

**Note:** Reinstalling X or a desktop environment later will require manually installing the necessary packages.

## **Additional Considerations**

- **Accessing a Graphical Session Temporarily:**
  
  Even after disabling the graphical interface from starting automatically, you can still start it manually when needed. For example:

  ```bash
  sudo systemctl start gdm3
  ```

  Replace `gdm3` with your display manager's service name.

- **Switching Between Targets Temporarily:**
  
  To switch to the graphical target for the current session without changing the default:

  ```bash
  sudo systemctl isolate graphical.target
  ```

  To switch back to the multi-user target:

  ```bash
  sudo systemctl isolate multi-user.target
  ```

- **Ensuring Network Availability:**
  
  If you rely on network services, ensure that network targets are correctly configured when disabling the graphical interface.

- **Using SSH:**
  
  If you disable X but need graphical applications remotely, consider using SSH with X11 forwarding or other remote desktop solutions.

## **Conclusion**

Disabling the X Window System from starting automatically can streamline your system for specific use cases, improve performance, and reduce resource consumption. The methods outlined above offer flexibility depending on whether you want to temporarily stop the graphical interface, permanently disable it, or remove it entirely. Always ensure you have alternative access methods (like SSH) configured, especially if you're managing a remote server, to prevent being locked out of your system.
