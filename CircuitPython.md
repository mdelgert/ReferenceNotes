### CircuitPython Web Workflow Code Editor Quick Start
https://learn.adafruit.com/getting-started-with-web-workflow-using-the-code-editor/overview

### CircuitPython and Version Control
http://www.movingelectrons.net/posts/circuitpython-and-version-control/

### Visual Studio Code Set Up
https://sites.google.com/view/circuitpython/development-environments/visual-studio-code-setup
https://www.hanselman.com/blog/using-visual-studio-code-to-program-circuit-python-with-an-adafruit-neotrellis-m4

### Using VisualStudio+ Python -- how to handle "overriding stdlib module" Pylance(reportShadowedImports) warning?
https://stackoverflow.com/questions/74660176/using-visualstudio-python-how-to-handle-overriding-stdlib-module-pylancer

.vscode/settings.json

{
  "python.languageServer": "Pylance",
  [...]
  "python.analysis.diagnosticSeverityOverrides": {
      "reportShadowedImports": "none"
  },
  [...]
}