
---

### ✅ 1. **Download Thunderbird**

You can use `wget` to download the latest version directly:

```bash
cd ~/Downloads
wget -O thunderbird.tar.bz2 "https://download.mozilla.org/?product=thunderbird-136.0.1-SSL&os=linux64&lang=en-US"
```

---

### ✅ 2. **Extract and Move to /opt**

```bash
mv thunderbird.tar.bz2 thunderbird.tar.xz
tar -xJf thunderbird.tar.xz
sudo mv thunderbird /opt/thunderbird
```

> The `/opt` directory is commonly used for manually installed software.

---

### ✅ 3. **Create a Symlink to Launch from Anywhere**

```bash
sudo ln -s /opt/thunderbird/thunderbird /usr/local/bin/thunderbird
```

Now you can type `thunderbird` in the terminal to launch it.

---

### ✅ 4. **Create a Desktop Shortcut**

Create the `.desktop` file:

```bash
nano ~/.local/share/applications/thunderbird.desktop
```

Paste the following into it:

```ini
[Desktop Entry]
Name=Thunderbird
Comment=Email Client
Exec=/opt/thunderbird/thunderbird
Icon=/opt/thunderbird/chrome/icons/default/default128.png
Terminal=false
Type=Application
Categories=Network;Email;
```

Save and exit (`Ctrl+O`, `Enter`, then `Ctrl+X`).

---

### ✅ 5. **Make It Executable**

```bash
chmod +x ~/.local/share/applications/thunderbird.desktop
```

---

### ✅ 6. **Add to Launcher or Activities**

- You can now **search "Thunderbird"** from your Activities menu.
- Optionally **right-click → Add to Favorites** to pin it to the dock.

---