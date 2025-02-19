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