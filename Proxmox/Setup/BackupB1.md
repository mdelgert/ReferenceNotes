rsync -avz /home/mdelgert/shared/ mdelgert@vm-d1:/home/mdelgert/shared

To use `rsync` to copy a directory from one Linux server to another, follow these steps:

### Syntax
```bash
rsync -avz [source_directory] [user]@[destination_server]:[destination_directory]
```

### Explanation:
- `rsync`: The command.
- `-a`: Archive mode; preserves symbolic links, permissions, timestamps, etc.
- `-v`: Verbose output (optional).
- `-z`: Compresses file data during the transfer (optional).
- `[source_directory]`: Path to the directory you want to sync.
- `[user]`: Username on the destination server.
- `[destination_server]`: IP address or hostname of the destination server.
- `[destination_directory]`: Path where you want the directory to be copied on the destination server.

### Example
Suppose you want to copy `/home/user/data` from server `A` to `/backup/data` on server `B`:

```bash
rsync -avz /home/user/data/ user@destination_server:/backup/data/
```

### Key Points:
1. **Trailing Slash (`/`)**:
   - Adding a trailing slash to the source directory (`/home/user/data/`) copies **only the contents**.
   - Omitting the trailing slash (`/home/user/data`) copies the directory itself and its contents.

2. **SSH Authentication**:
   - `rsync` uses SSH by default for secure file transfer. Ensure SSH access is set up between the two servers.
   - You may need to provide a password or use an SSH key for authentication.

3. **Dry Run**:
   - To preview the operation without making changes:
     ```bash
     rsync -avzn /home/user/data/ user@destination_server:/backup/data/
     ```

4. **Excluding Files**:
   - To exclude specific files or directories:
     ```bash
     rsync -avz --exclude 'file_or_dir_to_exclude' /home/user/data/ user@destination_server:/backup/data/
     ```

5. **Delete Option**:
   - To delete files in the destination directory that no longer exist in the source:
     ```bash
     rsync -avz --delete /home/user/data/ user@destination_server:/backup/data/
     ```

Let me know if you'd like further clarification or assistance!