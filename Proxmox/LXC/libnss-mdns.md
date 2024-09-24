### libnss-mdns

Based on your working configuration, it seems that **`libnss-mdns`** is not required for your setup since you already have **`wsdd`** and **`avahi-daemon`** providing the necessary network discovery functionality.

### When **`libnss-mdns`** is Typically Needed:
- `libnss-mdns` is part of the Name Service Switch (NSS) system, which enables Linux machines to resolve `.local` hostnames via mDNS. It integrates with Avahi for mDNS lookups.
- It's usually needed if you want the **Debian system itself** to resolve `.local` hostnames (i.e., if the Linux machine needed to resolve other `.local` devices on the network).

### In Your Case:
- Since **Windows discovery** is working fine using **`wsdd`**, and **mDNS** via Avahi is functional without the need for **`libnss-mdns`**, you don't require it unless you want your Debian server to resolve `.local` addresses for other devices on the network (for example, if your Samba server needed to connect to other `.local` devices).

### Conclusion:
If your current setup works without **`libnss-mdns`**, there's no need to add it. You only need it if you plan to resolve `.local` hostnames **from** your Samba server, not just **to** it. For now, you can continue with the configuration you have in place.

If you install **`libnss-mdns`**, it typically integrates with the system’s Name Service Switch (NSS) to enable mDNS name resolution (i.e., `.local` hostnames). This can improve hostname resolution across your system, but it's not strictly necessary in your current setup since things are already working.

### If You Install `libnss-mdns`:

1. **Effect on mDNS Resolution**:
   - `libnss-mdns` allows your system to resolve `.local` hostnames via mDNS, but since you're already resolving `.local` hostnames with Avahi, installing `libnss-mdns` may improve robustness by directly integrating mDNS into NSS for system-wide use. However, since you're resolving `.local` hostnames already, the benefit may be minimal.

2. **Do You Need `mdns name = mdns` in `smb.conf`?**:
   - The entry `mdns name = mdns` in Samba’s **`smb.conf`** controls whether Samba advertises its services via mDNS. With this setting, Samba will announce its name on the network via mDNS, which makes it discoverable by `.local` queries.
   - **If you install `libnss-mdns`**, you don’t necessarily need the `mdns name = mdns` entry, but having it won’t hurt. It ensures that Samba continues to advertise its presence via mDNS, which may help with network discovery in some cases (especially with `.local` hostnames).

### Recommendation:
- **Install `libnss-mdns`** if you want to prevent potential future issues with `.local` resolution, especially if the server might need to resolve `.local` hostnames in more complex networking setups.
  
- **Keep the `mdns name = mdns` entry** in your `/etc/samba/smb.conf`:
   - This ensures that Samba advertises itself over mDNS, improving discoverability for systems using `.local` hostnames.
   - It’s a harmless addition and keeps things consistent in case future network changes affect mDNS.

### Installation Steps:

1. Install `libnss-mdns`:

   ```bash
   sudo apt install libnss-mdns
   ```

2. **Verify the `/etc/nsswitch.conf` file**:
   - Ensure that the `hosts` line in `/etc/nsswitch.conf` includes `mdns` or `mdns4_minimal` (for IPv4 only), which allows the system to use mDNS for name resolution.

   Open `/etc/nsswitch.conf`:

   ```bash
   sudo nano /etc/nsswitch.conf
   ```

   Make sure it looks something like this:

   ```bash
   hosts: files mdns4_minimal [NOTFOUND=return] dns
   ```

   This ensures that the system checks `.local` via mDNS before falling back to DNS.

3. Restart Samba and Avahi after the changes:

   ```bash
   sudo systemctl restart smbd
   sudo systemctl restart avahi-daemon
   ```

### Conclusion:
- **Install `libnss-mdns`** if you want to strengthen `.local` name resolution.
- Keep the **`mdns name = mdns`** entry in your `smb.conf` file to ensure Samba continues advertising its services via mDNS. This provides better compatibility with devices that rely on `.local` lookups.

This will make your network setup more robust, but everything should continue to work even if you choose not to install `libnss-mdns`.

You're correct that the `mdns name = mdns` entry isn't commonly included by default in Samba's `smb.conf` configuration. It is an optional setting that allows you to specify how Samba advertises its services over mDNS. Samba 4.7 and later versions introduced this capability to support mDNS advertising, but it's not required unless you explicitly want to control how the service is advertised on the network.

The fact that it isn't in the default configuration file doesn't mean it can't be used, but most setups will not require this unless you are customizing how the service advertises over mDNS.

### 1. **Documentation on `mdns name` Setting**

Although there isn't widespread documentation or examples in common use for this specific setting, here’s a relevant link from the **Samba Wiki** that explains the `mdns name` option:

- [Samba Global Configuration Options](https://wiki.samba.org/index.php/Global_Parameters)
  
Search for the `mdns name` parameter on this page. The parameter is used to control how the server advertises itself via mDNS. The options are:
- `mdns name = mdns`: Advertises the Samba server via mDNS (multicast DNS).
- `mdns name = netbios`: Advertises the server via NetBIOS.
- `mdns name = mdns off`: Disables mDNS advertisement.

By default, this option may not be explicitly mentioned in `smb.conf`, and Samba will function normally using NetBIOS unless you need specific mDNS-based name advertisement.

### 2. **Confirming if `mdns name = mdns` is Valid**

To ensure that the setting is valid and does not cause any errors in your configuration, there are a couple of ways you can confirm that `smb.conf` is valid and won't generate configuration errors:

#### a. **Test the Samba Configuration with `testparm`**

Samba provides a tool called `testparm` that checks the validity of your `smb.conf` file and ensures there are no syntax errors or unsupported options.

To check your Samba configuration:

```bash
sudo testparm
```

This command will parse the `smb.conf` file and display any errors or warnings. If the `mdns name = mdns` entry is invalid or not supported, it will flag it as an error.

You can run it with additional flags for more verbose output:

```bash
sudo testparm -v
```

If no issues are found, `testparm` will confirm that your configuration is valid and ready to be applied.

#### b. **Samba Log Files**

After adding the `mdns name = mdns` entry, you can check the Samba log files for any errors or warnings. These logs are usually located in `/var/log/samba/` or `/var/log/syslog`.

If there's an issue with the configuration, the logs will contain messages indicating problems with parsing or loading the `smb.conf` file.

You can check the logs with:

```bash
sudo tail -f /var/log/samba/log.smbd
```

This will provide real-time logging of Samba activities. If there are any errors related to the `mdns` entry, they will appear here.

### 3. **Understanding the Use of `mdns name`**

In modern networks where **NetBIOS** is becoming less important and **mDNS** is being used more frequently (especially for discovery on local networks with devices like Macs or printers), adding the `mdns name` entry allows you to control how the Samba server advertises itself over mDNS.

Here are the options:

- **`mdns name = mdns`**: Advertises the server via mDNS, which is often useful in networks where `.local` hostname resolution is common.
- **`mdns name = netbios`**: If you still need NetBIOS for legacy support, this advertises the server using NetBIOS.
- **`mdns name = mdns off`**: This disables mDNS name advertisement completely.

However, as Samba is already being discovered in your network through **WS-Discovery** (using `wsdd`), the `mdns name = mdns` setting might not be necessary unless you're specifically optimizing for `.local` name resolution.

### Conclusion:

- **You don't need to add `mdns name = mdns` unless you want to customize how Samba advertises itself over mDNS**. Since it's working without this, you can skip it unless you specifically need mDNS advertisement.
  
- **Use `testparm`** to check the validity of your `smb.conf` file. This is the easiest way to verify that there are no syntax errors or unsupported options.

- **Samba version 4.17.12-Debian** fully supports this setting, so if you decide to add it, it shouldn't cause any issues as long as your network setup requires mDNS.

If everything is functioning properly without it, there’s no strong reason to add it unless you encounter a specific need for fine-grained mDNS control.