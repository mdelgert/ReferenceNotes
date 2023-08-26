# Powershell notes

https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3
https://stackoverflow.com/questions/66958069/how-to-remove-powershell-ads-and-update-checks-in-the-windows-terminal
https://learn.microsoft.com/en-us/powershell/scripting/learn/shell/tab-completion?view=powershell-7.3

{
    // no strict need for a GUID; create a *new* one, if needed.
    "hidden": false,
    "name": "PowerShell - no logo, no update notification",
    "commandline": "cmd /c set POWERSHELL_UPDATECHECK=Off & pwsh.exe -nologo"
    // ... other properties omitted.
},