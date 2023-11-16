# How to install Service Bus Explorer
https://github.com/paolosalvatori/ServiceBusExplorer
https://perry230.medium.com/how-to-install-service-bus-explorer-7b06cfcb5061

# Install (run as admin)
```PS
choco install ServiceBusExplorer
```

# Run from command
```PS
ServiceBusExplorer
```

# Create windows shortcut (run as admin)
```PS
# Set the path to the target file or application
$targetPath = "$env:ChocolateyInstall\lib\ServiceBusExplorer\tools\ServiceBusExplorer.exe"

# Set the path where you want to create the shortcut
$shortcutPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Service Bus Explorer.lnk"

# Create a WScript.Shell COM object
$objShell = New-Object -ComObject WScript.Shell

# Check if the COM object was created successfully
if ($objShell -eq $null) {
    Write-Host "Failed to create WScript.Shell object."
} else {
    # Create a shortcut object
    $objShortCut = $objShell.CreateShortcut($shortcutPath)

    # Check if the shortcut object was created successfully
    if ($objShortCut -eq $null) {
        Write-Host "Failed to create shortcut object."
    } else {
        # Set properties for the shortcut
        $objShortCut.TargetPath = $targetPath

        # Save the shortcut
        $objShortCut.Save()

        Write-Host "Shortcut created at: $shortcutPath"
    }
}
```