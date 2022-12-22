https://jeffbrown.tech/multiple-github-accounts-ssh/

eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa_jeff2

# Default Config - Work profile
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa
# Secondary Config - Personal profile
Host github.com-jeff2
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_jeff2