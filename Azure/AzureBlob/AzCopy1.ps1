# Define variables for source and destination storage accounts
$sourceAccount = "your_source_account"
$destinationAccount = "your_destination_account"

# Replace the following with the actual SAS tokens generated manually
$sourceSAS = "your_source_sas_token"   # Replace with the SAS token for the source account
$destinationSAS = "your_destination_sas_token"  # Replace with the SAS token for the destination account

# Define the log file location with a date-time stamp
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$logFile = "C:\Source\ReferenceNotes\Logs\azcopy_$timestamp.log"

# Function to log messages to both console and log file
function Log-Message {
    param ([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - $message"
    Write-Host $logEntry
    Add-Content -Path $logFile -Value $logEntry
}

# Locate AzCopy
Log-Message "Locating AzCopy..."
$azCopyCommand = Get-Command azcopy -ErrorAction SilentlyContinue
if ($null -eq $azCopyCommand) {
    Log-Message "Error: AzCopy not found. Please make sure AzCopy is installed and in your system's PATH."
    exit 1
} else {
    $azCopyPath = $azCopyCommand.Path
    Log-Message "AzCopy found at: $azCopyPath"
}

# Function to execute a command and capture its output
function Execute-Command {
    param (
        [string]$sourceUrl,
        [string]$destinationUrl
    )
    try {
        Log-Message "Executing AzCopy: $azCopyPath copy $sourceUrl $destinationUrl --recursive"
        & $azCopyPath "copy" $sourceUrl $destinationUrl "--recursive" 2>&1 | ForEach-Object { Log-Message $_ }
    } catch {
        Log-Message "Error occurred during command execution: $_"
    }
}

# Function to copy Blob containers
function Copy-BlobContainers {
    Log-Message "Starting Blob container copy..."
    
    # Set URLs with SAS tokens
    $sourceUrl = "https://$sourceAccount.blob.core.windows.net/?$sourceSAS"
    $destinationUrl = "https://$destinationAccount.blob.core.windows.net/?$destinationSAS"

    # Execute the AzCopy command
    Execute-Command $sourceUrl $destinationUrl
}

# Start copying Blob containers
Copy-BlobContainers

Log-Message "Copy operation completed."
