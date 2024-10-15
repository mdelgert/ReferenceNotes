# Configuration
$host = "192.168.50.240"            # Replace with the IP of your SSH server
$username = "HackWell"          # Invalid username for brute-force testing
$password = "invalid_password"      # Invalid password for brute-force testing
$attempts = 1000                      # Number of failed login attempts
$port = 22                          # SSH port (default is 22)

# Function to attempt SSH connection
function Attempt-SSHConnection {
    $command = "ssh -o StrictHostKeyChecking=no -o ConnectTimeout=3 $username@$host exit"
    $process = Start-Process -FilePath "cmd.exe" -ArgumentList "/c echo $password | $command" -NoNewWindow -PassThru
    $process.WaitForExit()
    if ($process.ExitCode -ne 0) {
        Write-Host "Failed login attempt."
    }
}

# Trigger brute-force alert
Write-Host "Triggering brute-force alert with $attempts failed login attempts..."
for ($i = 1; $i -le $attempts; $i++) {
    Attempt-SSHConnection
    Start-Sleep -Seconds 1  # Short delay between attempts
}

Write-Host "Brute-force simulation completed."
