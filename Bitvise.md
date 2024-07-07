# Bitvise WSL2 setup
https://dl.bitvise.com/BvSshServer-Inst.exe
https://dl.bitvise.com/BvSshClient-Inst.exe

Create custom shell
wsl -d ubuntu --cd ~
Permit exec requests (set this to no or VSCODE remote SSH will not work)
Exec request prefix leave blank

# Fix bitwise terminal background colors
```bash
nano ~/.bashrc
reset # Reset terminal settings to default
```

# How to run power shell from remote WSL2
```bash
pwsh.exe
```

# How to reboot from WSL2
```bash
pwsh.exe
Restart-Computer -Force # Method 1
shutdown /r /t 0 # Method 2
```

# How to run vmd from remote WSL2
```bash
cmd.exe
```

# Example (mnt/c/Users/$USERNAME/.wslconfig)

[wsl2]
vmIdleTimeout=-1
nestedVirtualization=false