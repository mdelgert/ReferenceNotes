# Example how to add pbcopy and pbpaste to WSL

https://www.youtube.com/watch?v=aMzdeZ8vGXQ

```bash
sudo apt install xsel
uname -r | xsel --input --clipboard
nano ~/.bashrc
alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output --clipboard'
source ~/.bashrc
echo "Hello" | pbcopy
pbpaste
```

