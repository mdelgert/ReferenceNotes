https://brew.sh/

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

https://gist.github.com/GaryRogers/e3c4d1caeac0dc4bca36

https://gist.github.com/mvneves/a6a69a53f039b3755900

https://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent

eval `ssh-agent -s`

chmod 600 ~/.ssh/SSH_Key

ssh-add -K SSH_Key

https://iterm2colorschemes.com/

cat ~/.ssh/SSH_Key.pub | ssh user@m1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
