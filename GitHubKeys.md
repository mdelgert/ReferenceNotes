https://jeffbrown.tech/multiple-github-accounts-ssh/
https://gist.github.com/oanhnn/80a89405ab9023894df7
https://gist.github.com/jexchan/2351996

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