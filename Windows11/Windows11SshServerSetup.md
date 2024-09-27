Here’s a step-by-step guide on how to enable the SSH server on Windows 11 using PowerShell, and how to set up `authorized_keys` assuming the `.ssh` folder does not exist:

### 1. **Enable the SSH Server Feature**

1. Open PowerShell as an administrator.
2. Install the OpenSSH Server feature:

   ```powershell
   Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*' # check if installed
   Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
   ```

3. Once the installation is complete, start the SSH server:

   ```powershell
   Start-Service sshd
   ```

4. Set the SSH server to start automatically on boot:

   ```powershell
   Set-Service -Name sshd -StartupType 'Automatic'
   ```

5. Confirm the SSH server is running:

   ```powershell
   Get-Service -Name sshd
   ```

### 2. **Allow SSH Through the Windows Firewall**

You need to allow SSH traffic through the Windows Firewall:

```powershell
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
```

### 3. **Create the `.ssh` Directory and `authorized_keys` File**

1. First, navigate to your user’s home directory:

   ```powershell
   cd $HOME
   ```

2. Create the `.ssh` directory if it doesn’t exist:

   ```powershell
   New-Item -ItemType Directory -Path .ssh
   ```

3. Change the permissions to ensure only the user has access:

   ```powershell
   icacls "$HOME\.ssh" /inheritance:r
   icacls "$HOME\.ssh" /grant "$($env:USERNAME):(F)"
   ```

4. Create the `authorized_keys` file inside the `.ssh` directory:

   ```powershell
   New-Item -ItemType File -Path $HOME\.ssh\authorized_keys
   ```

5. Set the appropriate permissions on the `authorized_keys` file:

   ```powershell
   icacls "$HOME\.ssh\authorized_keys" /inheritance:r
   icacls "$HOME\.ssh\authorized_keys" /grant "$($env:USERNAME):(F)"
   ```

6. Add your public key to the `authorized_keys` file. You can either copy the contents of your public key or use PowerShell to append it:

   ```powershell
   Add-Content "$HOME\.ssh\authorized_keys" "your-public-key-here"
   ```

### 4. **Restart the SSH Service**

After configuring `authorized_keys`, restart the SSH service to apply changes:

```powershell
Restart-Service sshd
```

You should now be able to SSH into your Windows 11 machine using your public key.

### Additional Notes
- Ensure that the `sshd_config` file located in `C:\ProgramData\ssh\` allows key-based authentication. It should have the following settings:

  ```
  PubkeyAuthentication yes
  AuthorizedKeysFile .ssh/authorized_keys
  ```

- If changes are needed in `sshd_config`, restart the SSH server after editing:

  ```powershell
  Restart-Service sshd
  ```