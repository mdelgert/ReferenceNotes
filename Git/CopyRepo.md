Yes, you can copy a GitHub repository to a new one while preserving the commit history. Here’s how:

1. **Clone the original repository**:
   ```bash
   git clone --bare https://github.com/username/original-repo.git
   ```
   The `--bare` flag is essential to preserve the complete history and not create a working directory.

2. **Create a new repository** on GitHub (or any Git hosting provider) without adding any files like `README.md` or `.gitignore`.

3. **Push the bare repository to the new remote**:
   ```bash
   cd original-repo.git
   git push --mirror https://github.com/username/new-repo.git
   ```
   The `--mirror` flag includes all refs and branches, keeping the entire history.

4. **Delete the local bare clone** (optional):
   ```bash
   cd ..
   rm -rf original-repo.git
   ```

Now, your new repository will have the same commit history as the original.