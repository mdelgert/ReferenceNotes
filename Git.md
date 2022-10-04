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
$ git remote set-url origin https://GithubToken@github.com/mdelgert/ReferenceNotes.git
```

# Reference
https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html

https://www.atlassian.com/git/glossary

```console
$ git config --list
```

```console
$ git config --global user.name "Matthew Elgert"
```

```console
$ git config --global user.email "mdelgert@yahoo.com"
```

```console
$ git clone https://github.com/mdelgert/ReferenceNotes.git
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