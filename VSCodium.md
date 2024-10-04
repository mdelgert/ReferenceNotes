
---

# Adding Extensions to VSCodium

To enhance your coding experience in VSCodium, you can manually install extensions. Here are two methods:

1. **Using VSIX Files:**
   - **Step 1: Find the Extension's VSIX File**
     Visit the Visual Studio Marketplace or the GitHub repository of the desired extension. Look for the VSIX file associated with that extension.
   - **Step 2: Download the VSIX File**
     Save the `.vsix` file to a known location on your computer (e.g., your Downloads folder).
   - **Step 3: Install the Extension in VSCodium**
     Open your terminal or command prompt and navigate to the directory where the VSIX file is saved. For example:
     ```
     cd ~/Downloads
     ```
     Then, install the extension using VSCodium's command line interface:
     ```
     codium --install-extension application-name-0.0.1.vsix
     ```
     Replace `application-name-0.0.1.vsix` with the actual filename of the downloaded VSIX file.
   - **Step 4: Verify the Installation**
     Open VSCodium, and you should see the installed extension in the Extensions sidebar.

2. **Enabling Access to the VS Code Extension Marketplace (Optional):**
   If you want to add access to the official VS Code Extension Marketplace, you can create a `product.json` file in the appropriate location:
   - On macOS: `~/Library/Application Support/VSCodium/product.json`
   - On Windows: `%APPDATA%\VSCodium\product.json`
   - On Linux: `~/.config/VSCodium/product.json`
   Add the following content to the `product.json` file: 
   ```json
   {
       "extensionsGallery": {
           "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
           "itemUrl": "https://marketplace.visualstudio.com/items"
       }
   }
   ```
   This will enable access to the official extension marketplace within VSCodium.

Remember that VSCodium is an open-source alternative to VS Code, and it doesn't include any proprietary Microsoft features. Enjoy coding! 😊

---

Feel free to reach out if you have any other questions or need further assistance! 🚀

![VSCodium](https://media.giphy.com/media/3o7TKzqBZU2vpxlG/giphy.gif)

¹: [Getting Started - Markdown Guide](https://www.markdownguide.org/getting-started/)
²: [Markdown Cheat Sheet – How to Write in Markdown with Examples](https://www.freecodecamp.org/news/markdown-cheat-sheet/)
³: [Markdown editing with Visual Studio Code](https://code.visualstudio.com/Docs/languages/markdown)
⁴: [Documenting your results with R Markdown](https://bookdown.org/kdonovan125/ibis_data_analysis_r4/documenting-your-results-with-r-markdown.html)
⁵: [How-To Geek's Markdown Cheat Sheet](https://www.howtogeek.com/markdown-cheat-sheet/)

Source: Conversation with Copilot, 10/4/2024
(1) Getting Started - Markdown Guide. https://www.markdownguide.org/getting-started/.
(2) Markdown Cheat Sheet – How to Write in Markdown with Examples. https://www.freecodecamp.org/news/markdown-cheat-sheet/.
(3) Markdown editing with Visual Studio Code. https://code.visualstudio.com/Docs/languages/markdown.
(4) 9 Documenting your results with R Markdown | Data Analysis and .... https://bookdown.org/kdonovan125/ibis_data_analysis_r4/documenting-your-results-with-r-markdown.html.
(5) How-To Geek's Markdown Cheat Sheet. https://www.howtogeek.com/markdown-cheat-sheet/.
