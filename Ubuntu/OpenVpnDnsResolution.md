### OpenVPN DNS Resolution with `.local` Domains in Ubuntu

This guide outlines how to set up proper DNS resolution for `.local` domains on an Ubuntu system using OpenVPN. This setup ensures that `.local` names can be resolved over your VPN, similar to how macOS handles DNS resolution.

---

### Steps for Setting Up DNS Resolution

1. **Enable mDNS (Multicast DNS)**:
   To ensure that `.local` domains are properly resolved, mDNS must be enabled in `systemd-resolved`.

   - Edit `/etc/systemd/resolved.conf`:
     ```bash
     sudo nano /etc/systemd/resolved.conf
     ```
   
   - Add or uncomment the following line:
     ```ini
     MulticastDNS=yes
     ```

   - Save the file and restart `systemd-resolved`:
     ```bash
     sudo systemctl restart systemd-resolved
     ```

2. **Configure DNS Search Domains for the VPN**:
   Ensure that the DNS search domain includes both the global (`~.`) and `.local` for the VPN interface.

   - List the network connections:
     ```bash
     nmcli connection show
     ```

   - Modify the VPN connection to include the search domains:
     ```bash
     sudo nmcli connection modify Home ipv4.dns-search "~. local"
     ```

   Replace `Home` with your actual VPN connection name.

3. **Restart the VPN Connection**:
   You can restart the VPN connection either from the NetworkManager GUI or via the command line:

   - From the GUI: Disconnect and reconnect to the VPN.
   - Or from the command line:
     ```bash
     nmcli connection down Home
     nmcli connection up Home
     ```

4. **Verify DNS Configuration**:
   After making the changes, check the DNS configuration to ensure that `.local` and `~.` are set correctly:

   ```bash
   resolvectl status
   ```

   Look for the `DNS Domain` section for your VPN interface (e.g., `tun0`), and confirm that both `~.` and `.local` are listed:

   ```
   Link 5 (tun0)
       Current Scopes: DNS
       Protocols: +DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
   Current DNS Server: 192.168.50.1
         DNS Servers: 192.168.50.1
          DNS Domain: ~. local
   ```

---

### How to Resolve Names Without `.local`

Once the setup is complete, you can resolve local names without explicitly using `.local` by simply typing the hostname. This behavior is similar to macOS:

- **Example**:
   ```bash
   ssh b1
   ```
   This command will resolve `b1.local` automatically without requiring the `.local` suffix, as the `.local` domain is automatically appended by the search domain configuration.

This is the **same behavior as macOS**, where `.local` domains are resolved automatically without needing to append `.local` to hostnames in commands like `ssh`.

---

### Troubleshooting Steps

1. **Check mDNS Status**:
   Ensure that mDNS is enabled and working by running:
   ```bash
   resolvectl status
   ```

   Verify that `MulticastDNS=yes` is set and that `.local` appears in the `DNS Domain` list for the VPN interface.

2. **Test DNS Resolution**:
   Use `nslookup` or `getent` to test if the hostname is being resolved:
   ```bash
   nslookup b1.local
   ```

3. **Ensure Search Domains Are Set**:
   Confirm that the search domains are correctly applied with:
   ```bash
   resolvectl status
   ```

4. **Check `/etc/nsswitch.conf`**:
   Ensure that the `hosts` line in `/etc/nsswitch.conf` includes `mdns4_minimal` for `.local` domain resolution:
   ```bash
   hosts: files mdns4_minimal [NOTFOUND=return] dns
   ```

5. **Restart the VPN Connection**:
   If changes are made to the configuration, restart the VPN connection to apply the new settings.

---

### Summary

By enabling `MulticastDNS` and configuring DNS search domains correctly, Ubuntu behaves similarly to macOS, where `.local` names can be resolved automatically, and DNS traffic is routed through the VPN. These settings ensure a smooth, automatic DNS resolution for both `.local` and regular domain names.