https://stackoverflow.com/questions/65468655/vs-code-remote-x11-cant-get-display-while-connecting-to-remote-server

https://x410.dev/cookbook/enabling-ssh-x11-forwarding-in-visual-studio-code-for-remote-development/#:~:text=Visual%20Studio%20Code%20supports%20remote,terminal%20in%20Visual%20Studio%20Code.

https://x410.dev/cookbook/built-in-ssh-x11-forwarding-in-powershell-or-windows-command-prompt/

https://marketplace.visualstudio.com/items?itemName=spadin.remote-x11

https://sourceforge.net/projects/vcxsrv/

# Example config
Host test
	IdentityFile ~/.ssh/rsa_id
	IdentitiesOnly yes
	ForwardX11 yes
	ForwardX11Trusted yes

run xlaunch

check disable access control

```pwsh
ssh -V
$env:DISPLAY="127.0.0.1:0.0"
$env:DISPLAY="l1:0.0"
echo $env:DISPLAY
ssh -Y <your_user_id>@<server_address>
```

# If you want to permanently add the DISPLAY environment variable to Windows, you can setx command:
```pwsh
setx DISPLAY "127.0.0.1:0.0"
```

# clear the setting
```pwsh
setx DISPLAY ""
```

# on remote server
```bash
echo $DISPLAY
export DISPLAY=localhost:10.0
```
