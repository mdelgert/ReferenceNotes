To use `az login` with the Azure CLI, follow these steps:

### **1. Log in to Azure interactively:**
```bash
az login
```
This opens a browser window prompting you to enter your Azure credentials. Once authenticated, the command line will display a list of subscriptions associated with your account.

---

### **2. Log in using a specific tenant:**
If you have access to multiple tenants, use:
```bash
az login --tenant TENANT_ID
```
Replace `TENANT_ID` with the directory (tenant) ID of your Azure Active Directory.

---

### **3. Log in using service principal (non-interactive):**
```bash
az login --service-principal -u APP_ID -p CLIENT_SECRET --tenant TENANT_ID
```
- `APP_ID` is your service principal application ID.
- `CLIENT_SECRET` is the service principal secret.
- `TENANT_ID` is the tenant ID.

---

### **4. Log in using a managed identity (for Azure VMs or services):**
```bash
az login --identity
```
This works when you're running the command from an Azure VM with managed identity enabled.

---

### **5. Log in using a device code (useful for headless servers):**
```bash
az login --use-device-code
```
This provides a code that you enter at [https://microsoft.com/devicelogin](https://microsoft.com/devicelogin) to authenticate.

---

### **6. Verify your login:**
After logging in, verify your account with:
```bash
az account show
```

---

💡 **Tip:** If you're automating scripts, consider using a service principal login to avoid manual authentication.

To list your Azure tenants using the Azure CLI, use the following command:

```bash
az account tenant list --output table
```

### **Explanation:**
- `az account tenant list` lists all tenants associated with your account.
- `--output table` formats the output in a readable table format. You can also use `--output json` or `--output yaml` if needed.

### **Example Output:**
```
TenantId                             DisplayName                    Default
---------------------------------   -----------------------------   -------
12345678-1234-1234-1234-123456789abc My Company                     True
87654321-4321-4321-4321-cba987654321 Another Company                False
```

### ✅ **Additional Options:**
To filter specific tenant information:
```bash
az account tenant list --query "[].{TenantId:id, Name:displayName}" --output table
```
This displays only the tenant ID and display name for a cleaner output.

To switch between different tenants using the Azure CLI, follow these steps:

---

### **1. List Available Tenants**  
First, list all tenants associated with your account:  
```bash
az account tenant list --output table
```
Note the `TenantId` of the tenant you want to switch to.

---

### **2. Switch Tenant Using `az login`**  
Use the `az login` command with the `--tenant` option:  
```bash
az login --tenant TENANT_ID
```
Replace `TENANT_ID` with the actual tenant ID from the previous step.  
Example:  
```bash
az login --tenant 12345678-1234-1234-1234-123456789abc
```
This will re-authenticate you under the selected tenant.

---

### **3. Verify the Current Tenant**  
Check the currently active tenant with:  
```bash
az account show --query "tenantId"
```
This confirms that you've successfully switched to the intended tenant.

---

### **4. Optional: Use a Specific Subscription in the Tenant**  
If you need to switch to a particular subscription within that tenant, use:  
```bash
az account set --subscription SUBSCRIPTION_ID
```
or by subscription name:  
```bash
az account set --subscription "Subscription Name"
```

---

### ✅ **Summary:**  
- Use `az login --tenant TENANT_ID` to switch tenants.  
- Use `az account show` to verify the active tenant.  
- Use `az account set` to select a specific subscription within that tenant.

This method works for both interactive and service principal logins.

To set a specific Azure subscription using the Azure CLI, use the following command:

### **1. List Available Subscriptions**
```bash
az account list --output table
```
This lists all subscriptions you have access to, showing their `Name`, `Id`, and `State`.

---

### **2. Set Subscription by ID**
```bash
az account set --subscription SUBSCRIPTION_ID
```
Replace `SUBSCRIPTION_ID` with the actual subscription ID from the previous command.

Example:
```bash
az account set --subscription 12345678-1234-1234-1234-123456789abc
az account set --subscription
```

---

### **3. Set Subscription by Name**
```bash
az account set --subscription "Subscription Name"
```
Replace `"Subscription Name"` with the exact name of your subscription.

Example:
```bash
az account set --subscription "My Production Subscription"
```

---

### **4. Verify the Current Subscription**
```bash
az account show --query "[name, id]" --output table
```
This will show the name and ID of the currently active subscription, confirming the switch.

---

### ✅ **Summary**
- Use `az account list` to find your subscriptions.
- Use `az account set --subscription` to switch subscriptions.
- Use `az account show` to verify the change.

This approach works for both interactive users and service principals.

Yes, Azure Cloud Shell provides persistent storage using an Azure file share. When you launch Cloud Shell for the first time, you're prompted to create a storage account and a file share. Here’s how persistence works and how you can manage it:

### 🔒 **How Persistence Works:**
- **File Share:** Files are stored in an Azure Storage account as a file share using Azure Files.  
- **Mounted at `/home/<username>`:** The share is automatically mounted to your Cloud Shell session at the home directory (`/home/<username>`).  
- **Persistence Across Sessions:** Any files stored in your home directory persist between sessions.

---

### 💾 **If You Haven't Set Up Persistence:**
1. **Automatic Prompt:** The first time you use Cloud Shell, it prompts you to create a file share. Follow the prompts to set it up.
2. **Manual Setup:** You can manually configure persistence by running:
   ```bash
   az storage account create --name <storage_account_name> --resource-group <resource_group> --location <location> --sku Standard_LRS
   az storage share create --account-name <storage_account_name> --name <file_share_name>
   ```

---

### 📂 **Accessing Files:**
- Files saved in `/home/<username>` are persistent.
- For example:
  ```bash
  echo "Hello Azure Cloud Shell" > myfile.txt
  cat myfile.txt
  ```

---

### 🗂 **Upload/Download Files:**
- Use the **Upload/Download** buttons in the Cloud Shell toolbar.
- Or use CLI commands like:
  ```bash
  # Upload
  az storage file upload --account-name <storage_account_name> --share-name <file_share_name> --source <local_file_path>

  # Download
  az storage file download --account-name <storage_account_name> --share-name <file_share_name> --path <file_path_in_share> --dest <local_path>
  ```

---

### 🧹 **Cleaning Up:**
If you no longer need persistence, delete the file share and/or storage account:
```bash
az storage share delete --account-name <storage_account_name> --name <file_share_name>
az storage account delete --name <storage_account_name> --resource-group <resource_group>
```

---

### ✅ **Summary:**
- Files in `/home/<username>` persist across sessions.
- Files outside `/home` are not persistent.
- The persistence is backed by Azure Files, ensuring your files are available in all future Cloud Shell sessions.

Let me know if you need step-by-step instructions specific to Bash or PowerShell environments! 😊
