https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-blobs-upload?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&bc=%2Fazure%2Fstorage%2Fblobs%2Fbreadcrumb%2Ftoc.json

**AzCopy** is a command-line utility provided by Microsoft to facilitate data transfer to and from Azure storage services. It's particularly useful for large-scale data operations like copying, moving, and syncing files between local directories and Azure Blob Storage, File Storage, or Table Storage. It can also help transfer data between Azure storage accounts.

### Key Features:
- **Supports Multiple Azure Services**: AzCopy works with Azure Blob, Azure Files, and Azure Table storage.
- **Fast Transfers**: Designed for high-performance transfers of large datasets.
- **Cross-Platform**: Available for Windows, macOS, and Linux.
- **Efficient**: Supports features like resumable file transfers and parallelism for faster execution.

### Installing AzCopy
You can download and install AzCopy on different platforms:

- **Windows**: Download from the [Microsoft Download Center](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10#download-azcopy).
- **Linux/macOS**: Use `curl` or the package manager to install.

For example, on Ubuntu:
```bash
curl -O https://aka.ms/downloadazcopy-v10-linux
tar -xvf ./downloadazcopy-v10-linux
sudo cp ./azcopy_linux_amd64_*/azcopy /usr/bin/
```

### Common Use Cases and Commands:

#### 1. **Copy Files to Azure Blob Storage**
To upload a file from your local system to an Azure Blob container:
```bash
azcopy copy '/path/to/local/file' 'https://<storage-account-name>.blob.core.windows.net/<container-name>/<blob-name>?<SAS-token>'
```
The `<SAS-token>` is a security token you generate in Azure for secure access.

#### 2. **Download Files from Azure Blob Storage**
To download a file from an Azure Blob container to your local system:
```bash
azcopy copy 'https://<storage-account-name>.blob.core.windows.net/<container-name>/<blob-name>?<SAS-token>' '/path/to/local/destination'
```

#### 3. **Synchronize Files**
You can sync files between a local directory and an Azure Blob container:
```bash
azcopy sync '/local/directory' 'https://<storage-account-name>.blob.core.windows.net/<container-name>?<SAS-token>'
```

This command ensures that only new or changed files are copied to the destination.

#### 4. **List Files in a Container**
To list the blobs in an Azure container:
```bash
azcopy list 'https://<storage-account-name>.blob.core.windows.net/<container-name>?<SAS-token>'
```

#### 5. **Remove Blobs**
You can remove a blob or a set of blobs:
```bash
azcopy remove 'https://<storage-account-name>.blob.core.windows.net/<container-name>/<blob-name>?<SAS-token>'
```

#### 6. **Copy Files Between Storage Accounts**
To copy files from one Azure storage account to another:
```bash
azcopy copy 'https://<source-storage-account>.blob.core.windows.net/<container-name>/<blob-name>?<SAS-token>' 'https://<destination-storage-account>.blob.core.windows.net/<container-name>/<blob-name>?<SAS-token>'
```

### Authentication
AzCopy allows different authentication methods like SAS tokens, Azure AD credentials, or connection strings.

To login interactively using Azure AD:
```bash
azcopy login
```

To logout:
```bash
azcopy logout
```

### Scheduling Jobs with Cron (Linux) or Task Scheduler (Windows)
AzCopy commands can be automated in scripts for scheduled backups or transfers. For example, on Linux, you can use `cron` jobs to automate transfers by placing an AzCopy command in a cron job configuration.

### Documentation and Help
For detailed documentation, you can visit the official [AzCopy documentation](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10). You can also get help by running:
```bash
azcopy --help
```

AzCopy is a powerful tool for handling bulk data transfer needs, particularly when you work with Azure Blob or file storage.

A **SAS token** (Shared Access Signature token) is a secure way to grant restricted access to your Azure Storage resources (such as blobs, containers, files, queues, or tables) without exposing your storage account keys. It allows you to specify permissions (read, write, delete, etc.), a time range, and other access restrictions.

Here’s how you can generate a SAS token for an Azure Blob Storage resource via the Azure Portal, Azure CLI, or Azure PowerShell:

### 1. **Using the Azure Portal**
To generate a SAS token using the Azure portal:

1. **Navigate to Storage Account**: 
   - Go to the [Azure portal](https://portal.azure.com/).
   - Select your **Storage Account** from the list.

2. **Go to the "Shared access signature" section**:
   - On the left-hand side, under the "Security + networking" section, select **Shared access signature**.

3. **Set the SAS Parameters**:
   - **Allowed Services**: Select the services you want the SAS token to apply to (e.g., Blob).
   - **Allowed Resource Types**: Choose whether the SAS token applies to containers, objects, or both.
   - **Permissions**: Choose the required permissions (e.g., read, write, list, delete).
   - **Start and Expiry Times**: Set the time range for which the SAS token is valid.
   - **IP Range**: Optionally, restrict access to specific IP addresses.
   - **Protocol**: Choose whether the token applies to HTTPS only or both HTTP and HTTPS.

4. **Generate the SAS Token and URL**:
   - Click on **Generate SAS and connection string** at the bottom of the screen.
   - The portal will generate a **SAS token** and a **Blob URL with SAS token**. Copy the token or URL to use in your application or command.

### 2. **Using Azure CLI**
To generate a SAS token using the Azure CLI, follow these steps:

First, make sure you are logged into the Azure CLI:

```bash
az login
```

Next, generate a SAS token using the `az storage account generate-sas` command:

```bash
az storage account generate-sas \
    --account-name <storage-account-name> \
    --permissions rwl \
    --expiry <expiry-date-time> \
    --resource-types co \
    --services b \
    --https-only
```

- Replace `<storage-account-name>` with your actual storage account name.
- Set `--permissions` for the required permissions (r = read, w = write, l = list, etc.).
- Set `--expiry` with an appropriate expiry date (e.g., `2024-09-24T00:00:00Z` for an expiration date in UTC).
- Set `--resource-types` to `co` for containers and objects.
- Set `--services` to `b` for Blob.

This will generate a SAS token, which you can append to your Blob URL.

#### Example:
```bash
az storage account generate-sas \
    --account-name mystorageaccount \
    --permissions rwl \
    --expiry 2024-09-24T00:00:00Z \
    --resource-types co \
    --services b \
    --https-only
```

### 3. **Using Azure PowerShell**
To generate a SAS token using Azure PowerShell, you can use the `New-AzStorageAccountSASToken` command:

```powershell
$storageAccount = Get-AzStorageAccount -ResourceGroupName <resource-group-name> -AccountName <storage-account-name>

$sasToken = New-AzStorageAccountSASToken `
    -Service Blob `
    -ResourceType Container,Object `
    -Permission rwl `
    -ExpiryTime (Get-Date).AddHours(2) `
    -Context $storageAccount.Context
```

This script generates a SAS token for the specified storage account, allowing read, write, and list permissions, valid for 2 hours.

### 4. **Using AzCopy to Generate SAS Token**
AzCopy also has a built-in command to generate a SAS token, but it requires the use of Azure Active Directory (AD) credentials. If you're authenticated using `azcopy login`, you can use:

```bash
azcopy make 'https://<storage-account-name>.blob.core.windows.net/<container-name>?<SAS-token>'
```

This command won't directly create a SAS token but helps with copying/moving data using your credentials without exposing account keys.

---

### Best Practices for SAS Tokens:
- **Set appropriate permissions**: Grant only the permissions needed (e.g., if you're uploading files, only grant `write`).
- **Limit the token’s validity period**: Set an appropriate expiry time for your use case to minimize the exposure of your storage account.
- **Use HTTPS**: Always use HTTPS when generating a SAS token to ensure encrypted communication.

Once you have your SAS token, you can append it to your blob/container URL like so:

```bash
https://<storage-account-name>.blob.core.windows.net/<container-name>/<blob-name>?<SAS-token>
```

You can now use this URL with AzCopy, REST APIs, or other tools.
