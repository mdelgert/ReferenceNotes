https://jeffbrown.tech/multiple-github-accounts-ssh/
https://gist.github.com/oanhnn/80a89405ab9023894df7
https://gist.github.com/jexchan/2351996

eval $(ssh-agent)
ssh-add ~/.ssh/CTI_RSA
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

However, to clone a repository using the personal profile from the config file, you need to change the hostname in the clone URL to match the hostname in the config file. Here is another example of a clone URL; note the modified hostname github.com-jeff2. This hostname matches the Host value defined in the config file.

git@github.com-jeff2:JeffBrown2/myCode.git    