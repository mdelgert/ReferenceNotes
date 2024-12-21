# Unattended Windows Installation
https://github.com/memstechtips/UnattendedWinstall

# Install winget in Power Shell
```PS
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
```

# Tiny windows
https://memstechtips.blogspot.com/2024/05/debloat-windows-11-tiny11-builder-tutorial.html#google_vignette
https://github.com/ntdevlabs/tiny11builder

# Set Execution Policy to Unrestricted run PS as admin
```PS 
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted
get-executionpolicy
```

# How to Log In Automatically to Windows 11
https://www.howtogeek.com/838506/how-to-sign-into-your-windows-11-pc-automatically/

(Change from 2 to 0)
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\DevicePasswordLessBuildVersion
(Uncheck users must enter a password)
run netplwiz

# Confirmed as of 05/16/2024 with VMWare Fusion 13.5.2 that you can install Windows with a local account simply by...
https://www.reddit.com/r/vmware/comments/17gvlyn/installing_windows_11_vm_without_a_windows_account/

"Set up for work or school" > "Sign-in options" > "Domain join instead".

After that, it's a local user creation and you're all done. No need to disconnect your network or run any commands in terminal, super easy!

# Set up Windows 11 without internet - oobe\bypassnro
https://answers.microsoft.com/en-us/insider/forum/all/set-up-windows-11-without-internet-oobebypassnro/4fc44554-b416-4ecb-8961-6f79fd55ae0f
https://www.tomshardware.com/how-to/install-windows-11-without-microsoft-account

Open cmd with Shift + F10 

```cmd
oobe\bypassnro
```

After reboot release ip select don't have internet setup limited

```cmd
ipconfig /release
```

# Set MS Windows 11 permanently to stop asking for sign-in password or pin
https://answers.microsoft.com/en-us/windows/forum/all/set-ms-windows-11-permanently-to-stop-asking-for/ac1fd729-1368-4b93-a513-c0e99b7e52a5
If you want to stop Windows 11 from asking for a sign-in password or PIN, you can try the following steps:

Press the Windows key + R on your keyboard to open the Run dialog box.
1. Type "netplwiz" (without quotes) and press Enter.
2. In the User Accounts window that opens, select your user account.
3. Uncheck the option that says "Users must enter a user name and password to use this computer."
4. Click Apply and enter your current password if prompted.
Click OK to close the User Accounts window.

#### FIX: Windows 11 keeps freezing randomly
[Link 1](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/repair-a-windows-image?view=windows-11)
[Link 2](https://www.youtube.com/watch?v=y4ULI57jjLI)
[Link 3](https://www.sweetwater.com/sweetcare/articles/how-to-use-dism-to-repair-windows-image/)

Run commands as admin:
1. DISM.exe /Online /Cleanup-image /Restorehealth
2. sfc /scannow
3. chkdsk c: /f /r
4. Adjust the appearance and performance of Windows
   ----> change initial size and max to recommended
4. windows memory diagnostic
