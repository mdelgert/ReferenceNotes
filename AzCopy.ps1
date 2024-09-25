# Define variables for source and destination storage accounts
$sourceAccount = "<source-storage-account-name>"
$sourceKey = "<source-storage-account-key>"
$destinationAccount = "<destination-storage-account-name>"
$destinationKey = "<destination-storage-account-key>"

# Specify what to copy: Set $copyBlobs to $true or $false and $copyTables to $true or $false
$copyBlobs = $true     # Set to $false to skip Blob container copying
$copyTables = $false   # Set to $false to skip Table copying

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
$sourceSAS = Generate-SASToken -accountName $sourceAccount -accountKey $sourceKey
$destinationSAS = Generate-SASToken -accountName $destinationAccount -accountKey $destinationKey

# Path to AzCopy
$azCopyPath = "C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy\AzCopy.exe"

# Function to copy Blob containers
function Copy-BlobContainers {
    # Get all Blob containers in the source account
    $containers = az storage container list --account-name $sourceAccount --account-key $sourceKey

    # Loop through each container and copy
    foreach ($container in $containers) {
        $containerName = $container.Name
        Write-Host "Copying Blob container: $containerName"
        Start-Process $azCopyPath -ArgumentList ("copy", "https://$sourceAccount.blob.core.windows.net/$containerName$sourceSAS", "https://$destinationAccount.blob.core.windows.net/$containerName$destinationSAS", "--recursive") -Wait
    }
}

# Function to copy Tables
function Copy-Tables {
    # Get all Tables in the source account
    $tables = az storage table list --account-name $sourceAccount --account-key $sourceKey

    # Loop through each table and copy
    foreach ($table in $tables) {
        $tableName = $table.Name
        Write-Host "Copying Table: $tableName"
        Start-Process $azCopyPath -ArgumentList ("copy", "https://$sourceAccount.table.core.windows.net/$tableName$sourceSAS", "https://$destinationAccount.table.core.windows.net/$tableName$destinationSAS", "--recursive") -Wait
    }
}

# Execute the copy based on the predefined settings
if ($copyBlobs -eq $true) {
    Write-Host "Copying Blob containers..."
    Copy-BlobContainers
}

if ($copyTables -eq $true) {
    Write-Host "Copying Tables..."
    Copy-Tables
}

Write-Host "Copy operation completed."
