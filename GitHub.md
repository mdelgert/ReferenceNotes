# Testing your SSH connection
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection

ssh -T git@github.com

# Connecting to GitHub with SSH
https://docs.github.com/en/authentication/connecting-to-github-with-ssh

# Adding a new SSH key to your GitHub account
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

# Managing remote repositories
https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories#switching-remote-urls-from-https-to-ssh

# Use Multiple SSH Keys for Git host websites (Github, Gitlab)
https://gist.github.com/alejandro-martin/aabe88cf15871121e076f66b65306610

# Multiple SSH Keys settings for different github account
https://gist.github.com/jexchan/2351996

# Use SSH keys to communicate with GitLab
https://docs.gitlab.com/ee/user/ssh.html

# Reference
https://learn.microsoft.com/en-us/azure/devops/repos/git/use-ssh-keys-to-authenticate?view=azure-devops

# Most common scenario: to use the same key across all hosted Azure DevOps
# organizations, add a Host entry like this:
Host ssh.dev.azure.com
  IdentityFile ~/.ssh/your_private_key
  IdentitiesOnly yes