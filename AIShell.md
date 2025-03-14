# AIShell

```PS
winget install Microsoft.AIShell
aish
/agent config
```

https://github.com/PowerShell/AIShell
https://learn.microsoft.com/en-us/powershell/utility-modules/aishell/how-to/agent-openai?view=ps-modules

{
  "logging": true,
  "telemetry": true,
  // Declare GPT instances.
  "GPTs": [
    // To use the Azure OpenAI service:
    // - Set `Endpoint` to the endpoint of your Azure OpenAI service,
    //     or the endpoint to the Azure API Management service if you are using it as a gateway.
    // - Set `Deployment` to the deployment name of your Azure OpenAI service.
    // - Set `ModelName` to the name of the model used for your deployment, e.g. "gpt-4-0613".
    // - Set `Key` to the access key of your Azure OpenAI service,
    //     or the key of the Azure API Management service if you are using it as a gateway.
    {
      "Name": "ps-az-gpt4",
      "Description": "A GPT instance with expertise in PowerShell scripting and command line utilities. Use gpt-4 running in Azure.",
      "Endpoint": "https://yourendpoint.openai.azure.com",
      "Deployment": "gpt-4o",
      "ModelName": "gpt-4o",   // required field to infer properties of the service, such as token limit.
      "Key": "<insert your key>",
      "SystemPrompt": "1. You are a helpful and friendly assistant with expertise in PowerShell scripting and command line.\n2. Assume user is using the operating system `Windows 11` unless otherwise specified.\n3. Use the `code block` syntax in markdown to encapsulate any part in responses that is code, YAML, JSON or XML, but not table.\n4. When encapsulating command line code, use '```powershell' if it's PowerShell command; use '```sh' if it's non-PowerShell CLI command.\n5. When generating CLI commands, never ever break a command into multiple lines. Instead, always list all parameters and arguments of the command on the same line.\n6. Please keep the response concise but to the point. Do not overexplain."
    },

    // To use the public OpenAI service:
    // - Ignore the `Endpoint` and `Deployment` keys.
    // - Set `ModelName` to the name of the model to be used.
    // - Set `Key` to be the OpenAI access token.
    // For example:
    {
        "Name": "ps-gpt4o",
        "Description": "A GPT instance with expertise in PowerShell scripting and command line utilities. Use gpt-4o running in OpenAI.",
        "ModelName": "gpt-4o",
        "Key": "<insert your key>",
        "SystemPrompt": "1. You are a helpful and friendly assistant with expertise in PowerShell scripting and command line.\n2. Assume user is using the operating system `Windows 11` unless otherwise specified.\n3. Use the `code block` syntax in markdown to encapsulate any part in responses that is code, YAML, JSON or XML, but not table.\n4. When encapsulating command line code, use '```powershell' if it's PowerShell command; use '```sh' if it's non-PowerShell CLI command.\n5. When generating CLI commands, never ever break a command into multiple lines. Instead, always list all parameters and arguments of the command on the same line.\n6. Please keep the response concise but to the point. Do not overexplain."
    }
    
  ],

  // Specify the default GPT instance to use for user query.
  "Active": "ps-az-gpt4"
}

# Add aish
nano ~/.bashrc
export PATH=$PATH:$HOME/Downloads/AIShell-1.0.0-preview.3-linux-x64