Here are the steps to set up Restic on Ubuntu, configure Azure Blob Storage as the backend, and manage credentials in a secure way for automation (such as running from cron jobs):

### 1. **Install Restic**
   
   First, update your package list and install Restic:
   ```bash
   sudo apt update
   sudo apt install restic
   ```

   Verify that Restic is installed:
   ```bash
   restic version
   ```

### 2. **Set Up Azure Blob Storage**

   Restic supports Azure Blob Storage as a backend. Follow these steps:

   #### a. Create an Azure Storage Account
   If you haven't created an Azure Storage Account, follow these steps in the Azure portal or using Azure CLI:
   
   ```bash
   az storage account create --name <yourstorageaccountname> --resource-group <yourresourcegroup> --location <location>
   ```

   #### b. Create a Blob Container
   Inside the storage account, create a container for Restic backups:
   
   ```bash
   az storage container create --account-name <yourstorageaccountname> --name <yourcontainername>
   ```
   #### c. Get the Access Key
   Retrieve your Azure Storage Account access key (needed for authentication):
   
   ```bash
   az storage account keys list --account-name <yourstorageaccountname> --query "[0].value"
   ```

### 3. **Configure Environment Variables for Restic**

   Restic requires environment variables to authenticate and interact with Azure Blob Storage. These are the key ones:

   - `RESTIC_REPOSITORY`: This points to your Azure Blob Storage container.
   - `AZURE_ACCOUNT_NAME`: The name of your Azure Storage Account.
   - `AZURE_ACCOUNT_KEY`: The key you retrieved in the previous step.
   - `RESTIC_PASSWORD`: The password for your Restic repository.

   To avoid being prompted for a password or access key every time, store them in environment variables or a secure location.

   #### a. Set Up the Environment Variables
   Create a file for environment variables, such as `/etc/restic_env`, and populate it with the following:
   
   ```bash
   export RESTIC_REPOSITORY=azure:yourcontainer:/yourreponame
   export AZURE_ACCOUNT_NAME=yourstorageaccountname
   export AZURE_ACCOUNT_KEY=yourazureaccountkey
   export RESTIC_PASSWORD=yourresticpassword
   ```

   Make the file readable only by the root user:
   ```bash
   sudo chown root:mdelgert /etc/restic_env
   sudo chmod 640 /etc/restic_env
   ```
   
   #### b. Load the Environment Variables
   In your script (or cron job), ensure this environment file is loaded before running Restic commands:
   
   ```bash
   source /etc/restic_env
   echo $RESTIC_REPOSITORY
   ```

### 4. **Initialize the Restic Repository**

   If this is the first time using the repository, initialize it with the following command:
   
   ```bash
   restic init
   ```

   This command will create the initial repository structure in your Azure Blob Storage container.

### 5. **Automate Backups with Cron**

   You can automate Restic backups by creating a cron job. First, write a backup script, e.g., `/usr/local/bin/restic_backup.sh`:

   ```bash
   #!/bin/bash
   source /etc/restic_env
   restic backup /path/to/your/files
   ```

   Make the script executable:
   ```bash
   sudo chmod +x /usr/local/bin/restic_backup.sh
   ```

   Then, create a cron job by running `crontab -e` and adding an entry for your backup schedule. For example, to run the backup daily at 2:00 AM:
   
   ```bash
   0 2 * * * /usr/local/bin/restic_backup.sh
   ```

### 6. **Security Best Practices**

   - **Environment File Permissions**: Ensure that `/etc/restic_env` is only accessible by root to prevent unauthorized users from accessing your Azure keys or Restic password.
   
   - **Avoid Plaintext Passwords**: While environment variables are one approach, another option is to store your Restic password in a key management service (such as Azure Key Vault) or use a password file with restrictive permissions (`chmod 600`). You can specify the file in your environment:
     ```bash
     export RESTIC_PASSWORD_FILE=/path/to/passwordfile
     ```

   - **Test the Setup**: Test your cron job by running the script manually to ensure everything works correctly.

By following these steps, you can automate Restic backups with Azure Blob Storage and avoid password prompts, making it ideal for running in non-interactive environments like cron jobs.