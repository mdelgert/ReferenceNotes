# Setup SSH key

https://docs.gitlab.com/ee/user/ssh.html

https://www.tutorialspoint.com/gitlab/gitlab_ssh_key_setup.htm

# Links
https://stackoverflow.com/questions/56287059/how-to-set-up-an-ssh-config-file-for-beginners

https://betterprogramming.pub/a-step-by-step-walkthrough-to-create-your-first-ssh-config-file-f01267b4eacb

https://linuxize.com/post/using-the-ssh-config-file/

# Setup config

cd ~
cd .ssh
touch config
nano config

# https://docs.gitlab.com/ee/user/ssh.html
# User1 Account Identity
Host gitlab.com
  Hostname gitlab.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/GitLabKey

# User2 Account Identity
# Host <user_2.gitlab.com>
#  Hostname gitlab.com
#  PreferredAuthentications publickey
#  IdentityFile ~/.ssh/<example_ssh_key2>