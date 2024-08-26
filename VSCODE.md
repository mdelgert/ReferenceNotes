### How To Change the VSCode Terminal Font Size
https://vscode.one/terminal-font-size/
Windows: Ctrl + Shift + P
Enter in "Open User Settings (JSON)"
"terminal.integrated.fontSize": 20

### User account not found in MSAL cache on Linux
[link](https://github.com/microsoft/vscode-mssql/issues/17744)

ctl + , temporarily disable "mssql.enableSqlAuthenticationProvider" setting until fix arrives in next release.

### To format C# code in Visual Studio Code (VSCode), follow these steps:

### 1. **Install the C# Extension**
   - If you haven't already, install the [C# extension](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp) provided by Microsoft. This extension provides features like IntelliSense, debugging, and formatting for C# code.

### 2. **Format on Save**
   - You can enable "Format on Save" to automatically format your code whenever you save the file:
     1. Open the Command Palette (`Ctrl + Shift + P` or `Cmd + Shift + P` on macOS).
     2. Type and select `Preferences: Open Settings (UI)`.
     3. Search for `format on save`.
     4. Check the box for `Editor: Format On Save`.

### 3. **Manually Format Code**
   - To manually format your C# code, you can use the following commands:
     - **Windows/Linux:** `Shift + Alt + F`
     - **macOS:** `Shift + Option + F`
   - Alternatively, right-click within the editor and select `Format Document`.

### 4. **Configure C# Formatting Options**
   - You can customize the formatting rules by editing the `.editorconfig` file or through VSCode's settings:
     1. Create or open a `.editorconfig` file in your project root.
     2. Add or modify the relevant C# formatting rules.
     3. You can also configure formatting options directly in VSCode by searching for `C# Formatting` in the settings (`Ctrl + ,`).

### 5. **Using Command Palette**
   - You can also format the code by using the Command Palette:
     1. Open the Command Palette (`Ctrl + Shift + P` or `Cmd + Shift + P` on macOS).
     2. Type `Format Document` and select it to format the entire document.
