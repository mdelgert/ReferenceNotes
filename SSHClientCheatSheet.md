```markdown
# SSH Agent Cheat Sheet

## List all keys currently managed by the SSH agent
```sh
ssh-add -L
```
- **Description**: Displays all keys currently loaded in the SSH agent.

## Remove a specific key from the SSH agent
```sh
ssh-add -d /path/to/your/key
```
- **Example**: Remove the default RSA key.
  ```sh
  ssh-add -d ~/.ssh/id_rsa
  ```
- **Description**: Removes the specified key from the SSH agent.

## Remove all keys from the SSH agent
```sh
ssh-add -D
```
- **Description**: Removes all keys currently managed by the SSH agent.

## Add a specific key to the SSH agent
```sh
ssh-add /path/to/your/key
```
- **Example**: Add the default RSA key.
  ```sh
  ssh-add ~/.ssh/id_rsa
  ```
- **Description**: Adds the specified key to the SSH agent.

## Start the SSH agent (if it's not running)
```sh
eval $(ssh-agent)
```
- **Description**: Starts a new instance of the SSH agent and sets the appropriate environment variables.

## Notes
- **Default Key Locations**: The SSH client automatically uses keys from default locations (`~/.ssh/id_rsa`, `~/.ssh/id_ecdsa`, `~/.ssh/id_ed25519`).
- **SSH Agent Environment Variables**: `SSH_AUTH_SOCK` and `SSH_AGENT_PID` are used to locate the SSH agent.
```
