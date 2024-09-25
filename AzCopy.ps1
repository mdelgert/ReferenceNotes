# Define variables for source and destination storage accounts
$sourceAccount = "<source-storage-account-name>"
$sourceKey = "<source-storage-account-key>"
$destinationAccount = "<destination-storage-account-name>"
$destinationKey = "<destination-storage-account-key>"

# Specify what to copy: Set $copyBlobs to $true or $false and $copyTables to $true or $false
$copyBlobs = $true     # Set to $false to skip Blob container copying
$copyTables = $false   # Set to $false to skip Table copying

# Define the log file location with a date-time stamp
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$logFile = "C:\temp\azcopy_$timestamp.log"

# Function to log messages to both console and log file
function Log-Message {
    param ([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - $message"
    Write-Host $logEntry
    Add-Content -Path $logFile -Value $logEntry
}

# SAS token generation function for source and destination storage accounts
function Generate-SASToken {
    param (
        [string]$accountName,
        [string]$accountKey
    )
    $expiry = [datetime]::UtcNow.AddHours(24).ToString("yyyy-MM-ddTHH:mm:ssZ")
    $sasToken = "&sig=" + [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($expiry))  # Simplified for demo
    return $sasToken
}

# Generate SAS tokens
Log-Message "Generating SAS tokens for source and destination storage accounts..."
$sourceSAS = Generate-SASToken -accountName $sourceAccount -accountKey $sourceKey
$destinationSAS = Generate-SASToken -accountName $destinationAccount -accountKey $destinationKey

# Locate AzCopy using Get-Command
Log-Message "Locating AzCopy..."
$azCopyCommand = Get-Command azcopy -ErrorAction SilentlyContinue
if ($null -eq $azCopyCommand) {
    Log-Message "Error: AzCopy not found. Please make sure AzCopy is installed and in your system's PATH."
    exit 1
} else {
    $azCopyPath = $azCopyCommand.Path
    Log-Message "AzCopy found at: $azCopyPath"
}

# Function to copy Blob containers
function Copy-BlobContainers {
    Log-Message "Fetching list of Blob containers..."
    $containers = az storage container list --account-name $sourceAccount --account-key $sourceKey

    # Loop through each container and copy
    foreach ($container in $containers) {
        $containerName = $container.Name
        Log-Message "Copying Blob container: $containerName"
        Start-Process $azCopyPath -ArgumentList ("copy", "https://$sourceAccount.blob.core.windows.net/$containerName$sourceSAS", "https://$destinationAccount.blob.core.windows.net/$containerName$destinationSAS", "--recursive") -Wait
        Log-Message "Completed copying Blob container: $containerName"
    }
}

# Function to copy Tables
function Copy-Tables {
    Log-Message "Fetching list of Tables..."
    $tables = az storage table list --account-name $sourceAccount --account-key $sourceKey

    # Loop through each table and copy
    foreach ($table in $tables) {
        $tableName = $table.Name
        Log-Message "Copying Table: $tableName"
        Start-Process $azCopyPath -ArgumentList ("copy", "https://$sourceAccount.table.core.windows.net/$tableName$sourceSAS", "https://$destinationAccount.table.core.windows.net/$tableName$destinationSAS", "--recursive") -Wait
        Log-Message "Completed copying Table: $tableName"
    }
}

# Execute the copy based on the predefined settings
if ($copyBlobs -eq $true) {
    Log-Message "Starting Blob container copy..."
    Copy-BlobContainers
}

if ($copyTables -eq $true) {
    Log-Message "Starting Table copy..."
    Copy-Tables
}

Log-Message "Copy operation completed."
