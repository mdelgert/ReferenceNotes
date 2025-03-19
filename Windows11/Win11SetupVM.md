### Memory Integrity Core Isolation
https://community.intel.com/t5/Processors/Memory-Integrity-in-Core-Isolation-is-not-working-due-to-quot/m-p/1488157

https://www.howtogeek.com/fix-memory-integrity-errors-on-windows-11/

### Delete olde driver
https://answers.microsoft.com/en-us/windows/forum/all/memory-integrity-off-because-of-incompatible/addad2e4-ef42-4483-83af-94cfcfe6e32e

Delete E1G6032E.sys

### Check windows integrity
https://support.microsoft.com/en-us/topic/use-the-system-file-checker-tool-to-repair-missing-or-corrupted-system-files-79aa86cb-ca52-166a-92a3-966e85d4094e

```ps
DISM.exe /Online /Cleanup-image /Restorehealth 
sfc /scannow
```

### Clear windows logs
```ps
wevtutil el | ForEach-Object { wevtutil cl "$_" }
```