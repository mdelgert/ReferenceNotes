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
