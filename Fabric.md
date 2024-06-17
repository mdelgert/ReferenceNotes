# Fabic 

https://github.com/danielmiessler/fabric
https://github.com/danielmiessler/fabric/discussions/428
https://github.com/danielmiessler/fabric/issues/373

```bash
nano ~.config/fabric/.env
#No API key set
export DEFAULT_MODEL="llama3:latest"
```

```bash
fabic --listmodels
echo "Search for recent articles about the future of AI and write me a 500-word essay on the findings" | fabric -m llama3:latest -p create_summary --stream
yt --transcript https://youtube.com/watch?v=uXs-zPc63kM | fabric -m llama3:latest --stream --pattern extract_wisdom
curl https://raw.githubusercontent.com/danielmiessler/fabric/main/README.md | fabric -m llama3:latest -p create_summary --stream
cat test.md | fabric -m llama3:latest -p create_summary --stream
pbpaste | explain_code -m llama3:latest --stream
pbpaste | explain_code --stream
pbpaste | fabric -m llama3:latest -p analyze_claims --stream 
```