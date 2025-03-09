# Fix: Search Not Working in Windows 11

If Windows 11's search is unresponsive, missing results, or not working, follow these steps to resolve the issue.

## 1. Restart Your Computer
A simple reboot can fix temporary glitches affecting search.

## 2. Open the Run Dialog Box
Press `Win + R` to open **Run**, then close it. This may refresh the search functionality.

## 3. Restart `SearchHost.exe`
1. Press `Ctrl + Shift + Esc` to open **Task Manager**.
2. Go to the **Details** tab.
3. Right-click `SearchHost.exe` and select **End Task**.
4. Confirm the action and try using search again.

## 4. Modify Search Settings
1. Press `Win + I` to open **Settings**.
2. Navigate to **Privacy & Security > Searching Windows**.
3. Under **Find My Files**, select **Enhanced** to index all folders.
4. Ensure important folders are not excluded from search indexing.

## 5. Restart or Enable Windows Search Service
1. Press `Win + R`, type `services.msc`, and press Enter.
2. Find **Windows Search** in the list.
3. If it's not running, right-click and select **Start**.
4. If running, right-click and choose **Restart**.

## 6. Rebuild the Search Index
1. Open **Settings** (`Win + I`).
2. Navigate to **Privacy & Security > Searching Windows**.
3. Scroll down and select **Advanced Indexing Options**.
4. Click **Advanced**, then **Rebuild** under **Troubleshooting**, and confirm.

## 7. Check for Windows Updates
1. Press `Win + I` to open **Settings**.
2. Go to **Windows Update** and click **Check for updates**.
3. Install any available updates.

## 8. Undo Recent Changes
- Uninstall recently installed software or drivers.
- Use **System Restore** to revert your system to an earlier state.

## 9. Reset Windows 11 (Last Resort)
1. Go to **Settings > System > Recovery**.
2. Click **Reset PC** and follow the prompts.

For more details, visit the original article on [Lifewire](https://www.lifewire.com/fix-search-not-working-in-windows-11-5191397).

[Reference1](https://www.lifewire.com/fix-search-not-working-in-windows-11-5191397)

[Reference2](https://learn.microsoft.com/en-us/troubleshoot/windows-client/shell-experience/fix-problems-in-windows-search)