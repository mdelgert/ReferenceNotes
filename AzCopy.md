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

