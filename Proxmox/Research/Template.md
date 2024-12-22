# Proxmox LXC Template Export Guide

## Step 1: Prepare the LXC Container

1. **Stop the LXC Container** (if it’s running):

   ```bash
   pct stop <container-id>
   ```

2. **Ensure the Container is in a Good State**:

   Make sure the container’s filesystem is clean. You can optionally run a filesystem check:

   ```bash
   pct fsck <container-id>
   ```

## Step 2: Create the Template

1. **Convert the Container into a Template**:

   To convert your container into a template, use the `pct` command:

   ```bash
   pct set <container-id> --template
   ```

## Step 3: Export the LXC Template

1. **Find the Template ID**:

   You need to know the template ID for the next step. List all templates to find your container’s new template ID:

   ```bash
   pveam available
   ```

   Or check your local templates directory:

   ```bash
   ls /var/lib/vz/template/cache/
   ```

2. **Export the Template**:

   To export the template, use the `vzdump` command:

   ```bash
   #vzdump <template-id> --dumpdir /path/to/export/directory --compress lzo
   vzdump <template-id> --dumpdir /path/to/export/directory --compress zstd
   ```

   - Replace `<template-id>` with the ID of your template.
   - Replace `/path/to/export/directory` with the path where you want to save the exported template.
   - `--compress lzo` specifies that you want to compress the dump file. You can also use other compression methods like `gzip` or `zstd`.

## Step 4: Verify the Export

1. **Check the Exported File**:

   Navigate to the export directory and verify that the template file is present:

   ```bash
   ls /path/to/export/directory
   ```

## Step 5: Import the Template (Optional)

To import the template on another Proxmox server, you can transfer the exported file to the target server and use the `pct` command to import it:

1. **Transfer the File**:

   You can use tools like `scp` or `rsync` to transfer the `.tar.lzo` file to the target Proxmox server.

2. **Import the Template**:

   On the target server, import the template with:

   ```bash
   pct restore <new-container-id> /path/to/export/directory/template-file.tar.lzo
   ```

   - Replace `<new-container-id>` with a new container ID for the restored template.
   - Replace `/path/to/export/directory/template-file.tar.lzo` with the path to the transferred template file.

## Summary of Commands

```bash
# Stop the container
pct stop <container-id>

# (Optional) Check filesystem
pct fsck <container-id>

# Convert to template
pct set <container-id> --template

# Export the template
vzdump <template-id> --dumpdir /path/to/export/directory --compress lzo

# Check the export
ls /path/to/export/directory

# (Optional) Import the template on another server
pct restore <new-container-id> /path/to/export/directory/template-file.tar.lzo
```