https://askubuntu.com/questions/614534/disable-authentication-prompts-in-15-04-and-later-versions

```bash
sudo su
cd /etc/polkit-1/rules.d/
nano 99-nopassword.rules
systemctl restart polkit
```

polkit.addRule(function(action, subject) {
    if (subject.isInGroup("sudo")) {
        // or subject.user == "muru"
        return polkit.Result.YES;
    }
});

After running the command `sudo nano /etc/polkit-1/localauthority/50-local.d/99-nopasswd.rules`, you’ll be in the Nano text editor. In this file, add the following content to disable password prompts for privileged actions for a specific user or group:

```javascript
polkit.addRule(function(action, subject) {
    if (subject.isInGroup("your_username") || subject.isInGroup("your_usergroup")) {
        return polkit.Result.YES;
    }
});
```

**Instructions**:

1. Replace `"your_username"` with your actual username.
2. Alternatively, replace `"your_usergroup"` with `"sudo"` or the desired group if you prefer group-wide application.

**After Editing**:

1. Press `Ctrl + X` to exit.
2. Type `Y` and press `Enter` to save changes.

Then, restart the PolicyKit service:

```bash
sudo systemctl restart polkit
```

This configuration should remove password prompts for all privileged actions for the specified user or group.