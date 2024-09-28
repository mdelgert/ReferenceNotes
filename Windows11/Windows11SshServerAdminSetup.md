Related article on [Windows OS Hub](https://woshub.com/using-ssh-key-based-authentication-on-windows/)【18†source】【19†source】.

To enable SSH key-based authentication for an administrative account on Windows, follow these steps:

### 1. **Install OpenSSH Server**
First, install the OpenSSH Server feature using PowerShell:

```powershell
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
```

### 2. **Start and Configure the SSH Service**
Start the SSH service and ensure it starts automatically on boot:

```powershell
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
```

### 3. **Allow SSH Through the Firewall**
Ensure that SSH traffic is allowed through Windows Defender Firewall:

```powershell
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
```

### 4. **Add Public Key to `administrators_authorized_keys`**
For administrative accounts, SSH public keys should be stored in the `administrators_authorized_keys` file rather than the user profile's `authorized_keys`.

1. Create the `administrators_authorized_keys` file if it doesn’t exist:

   ```powershell
   New-Item -ItemType File -Path "C:\ProgramData\ssh\administrators_authorized_keys"
   ```

2. Add your public key to the file using any text editor (e.g., Notepad).

### 5. **Set the Correct Permissions**
Ensure only the `Administrators` group and `SYSTEM` can access the `administrators_authorized_keys` file:

```powershell
icacls "C:\ProgramData\ssh\administrators_authorized_keys" /inheritance:r
icacls "C:\ProgramData\ssh\administrators_authorized_keys" /grant "Administrators:F" /grant "SYSTEM:F"
```

### 6. **Update `sshd_config`**
Edit the SSH configuration file `C:\ProgramData\ssh\sshd_config` to enable public key authentication and specify the correct file for administrative users:

1. Open the file with a text editor:

   ```powershell
   notepad "C:\ProgramData\ssh\sshd_config"
   ```

2. Ensure these lines are uncommented or added:

   ```plaintext
   PubkeyAuthentication yes
   AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys
   ```

3. Restart the SSH service to apply the changes:

   ```powershell
   Restart-Service sshd
   ```

### After following these steps, you will be able to log in using your SSH key as an administrator without needing a password.