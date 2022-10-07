# Reference
https://learn.microsoft.com/en-us/azure/devops/repos/git/use-ssh-keys-to-authenticate?view=azure-devops

# Most common scenario: to use the same key across all hosted Azure DevOps
# organizations, add a Host entry like this:
Host ssh.dev.azure.com
  IdentityFile ~/.ssh/your_private_key
  IdentitiesOnly yes