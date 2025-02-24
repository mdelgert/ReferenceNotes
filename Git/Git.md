# Actual command not found, wanted to execute git.sync /8
https://github.com/microsoft/vscode/issues/170117
https://github.com/microsoft/vscode/issues/170117#issuecomment-1369572211
https://stackoverflow.com/questions/71201591/vscode-git-sync-keeps-executing-with-wrong-arguments

# Change email address in Git
https://stackoverflow.com/questions/37805621/change-email-address-in-git

```bash
git config --global user.name "John Doe"  
git config --global user.email johndoe@example.com  
git config --list
```

# Generating a new SSH key and adding it to the ssh-agent
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
https://www.atlassian.com/git/tutorials/git-ssh
https://krshillman.medium.com/setting-up-gitbash-with-ssh-on-windows-52b0f28ad84e

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

# How to switch to an existing branch in Git
https://www.freecodecamp.org/news/git-switch-branch/

git switch -c dev

# How to fix support for password authentication was removed on GitHub
https://levelup.gitconnected.com/fix-password-authentication-github-3395e579ce74

* Click on your GitHub profile icon on the top right corner
* Click Settings
* From the menu shown on the left, click Developer Settings
* Click Personal access tokens
* Click Generate new token
* Add a note that will help you identify the scope of the access token to be generated
* Choose the Expiration period from the drop down menu (Ideally you should avoid choosing the No Expiration option)
* Finally, select the scopes you want to grant the corresponding access to the generated access token. Make sure to select the minimum required scopes otherwise you will still have troubles performing certain Git Operations.
* Finally click Generate Token

```console
$ git remote set-url origin https://GithubToken@github.com/user/ReferenceNotes.git
```

# Reference
https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html

https://www.atlassian.com/git/glossary

```console
$ git config --list
```

```console
$ git config --global user.name "First lastname"
```

```console
$ git config --global user.email "user@yahoo.com"
```

```console
$ git add .
```

```console
$ git commit -m "test"
```

```console
$ git push
```