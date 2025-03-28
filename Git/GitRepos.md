
---

# Managing Multiple GitHub Accounts with SSH and Git

This README outlines how to configure your system to work with multiple GitHub accounts using SSH key-based authentication and repository-specific Git settings. This setup is ideal for developers juggling personal and work accounts or multiple identities on GitHub.

## Prerequisites
- Git installed on your system.
- SSH keys generated for each GitHub account (e.g., `~/.ssh/id_primary` and `~/.ssh/id_second`).
- Each SSH key added to its respective GitHub account under **Settings > SSH and GPG keys**.

## Step 1: Configure SSH for Multiple Accounts

Edit or create the SSH configuration file at `~/.ssh/config`:

```plaintext
# Primary GitHub account
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_primary

# Second GitHub account
Host github.com-second
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_second
```

- `Host github.com` uses the primary key (`id_primary`).
- `Host github.com-second` uses the second key (`id_second`).
- Replace `id_primary` and `id_second` with the actual filenames of your SSH private keys.

### Test SSH Configuration
Verify each key works:
```bash
ssh -T git@github.com
ssh -T git@github.com-second
```
GitHub will respond with the authenticated username for each account (e.g., "Hi primary-username!" or "Hi second-username!").

## Step 2: Set Up Git Configurations

Git uses `user.name` and `user.email` to identify commit authors. By default, these are set globally, but you can override them per repository.

### Option A: Repository-Specific Git Config
For each repository, set the correct identity locally.

1. Navigate to the repo directory:
   ```bash
   cd /path/to/your/repo
   ```

2. Set the local `user.name` and `user.email`:
   ```bash
   git config user.name "Your Name"
   git config user.email "your-email@example.com"
   ```

3. Verify the settings:
   ```bash
   git config --get user.name
   git config --get user.email
   ```

- Use your primary account’s details for repos under `github.com`.
- Use your second account’s details for repos under `github.com-second`.

### Option B: Conditional Git Config (Scalable)
For a more automated approach, use conditional includes in your global Git config (`~/.gitconfig`).

Edit `~/.gitconfig`:
```ini
[user]
    name = Primary Name
    email = primary-email@example.com

[includeIf "gitdir:~/projects/primary/"]
    path = ~/.gitconfig-primary

[includeIf "gitdir:~/projects/second/"]
    path = ~/.gitconfig-second

# Windows absolute paths paths
[includeIf "gitdir:/c/Users/JohnDoe/projects/primary/"]
    path = /c/Users/JohnDoe/.gitconfig-primary

[includeIf "gitdir:/c/Users/JohnDoe/projects/second/"]
    path = /c/Users/JohnDoe/.gitconfig-second

# Mixed mode
[includeIf "gitdir:/c/Source/primary/"]
    path = ~/.gitconfig-primary

[includeIf "gitdir:/c/Source/second/"]
    path = ~/.gitconfig-second
```

Create `~/.gitconfig-primary`:
```ini
[user]
    name = Primary Name
    email = primary-email@example.com
```

Create `~/.gitconfig-second`:
```ini
[user]
    name = Second Name
    email = second-email@example.com
```

- Organize repos into directories like `~/projects/primary/` and `~/projects/second/`.
- Git will apply the correct identity based on the repo’s location.

## Step 3: Configure Repository Remotes

Check the remote URL of your repo:
```bash
git remote -v
```

- For primary account repos, use:
  ```bash
  git remote set-url origin git@github.com:primary-username/repo.git
  ```
- For second account repos, use:
  ```bash
  git remote set-url origin git@github.com-second:second-username/repo.git
  ```

Replace `primary-username`, `second-username`, and `repo` with your actual GitHub usernames and repository names.

## Step 4: Test Your Setup

1. Clone or work with a repo:
   - Primary: `git clone git@github.com:primary-username/repo.git`
   - Second: `git clone git@github.com-second:second-username/repo.git`

2. Make a test commit:
   ```bash
   echo "Test" >> README.md
   git add README.md
   git commit -m "Test commit"
   git push
   ```

3. Check GitHub to confirm the commit appears under the correct account.

## Troubleshooting

- **Wrong email in commits?**
  - Ensure the local `user.email` is set correctly or the conditional include matches the repo’s path.
  - Check `git config --list --show-origin` to see which config file is being applied.

- **Authentication issues?**
  - Run `ssh -vT git@github.com-second` to debug SSH key usage.
  - Ensure the key is added to your SSH agent: `ssh-add ~/.ssh/id_second`.

- **Rewriting commit history (optional):**
  If past commits have the wrong email, use:
  ```bash
  git filter-repo --email-callback 'return b"new-email@example.com"'
  ```
  (Requires `git-filter-repo` installed; back up your repo first.)

## Best Practices

- Keep SSH keys secure and never share them.
- Use meaningful directory structures for conditional configs (e.g., `~/personal/` vs. `~/work/`).
- Avoid global overrides (`git config --global`) unless intentional.

## Additional Resources

- [Git Documentation](https://git-scm.com/docs)
- [GitHub SSH Guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

---

This README provides a generic, reusable guide without referencing specific company or account details. You can adapt it by replacing placeholders like `primary-username`, `second-username`, `id_primary`, and `id_second` with your actual values. Let me know if you’d like adjustments!