
# Build your own Raspberry Pi Git Server
https://pimylifeup.com/raspberry-pi-git-server/
apt install git-core
git config --global init.defaultBranch master
mkdir Source
cd Source
mkdir PrivateGit
cd PrivateGit
mkdir test
cd test
git init --bare

# Remote computer
cd /Source/PrivateGit
mkdir test
cd test
git init
git remote add test user@pi1:/home/user/Source/PrivateGit/test
touch test
echo "hello git" >> test
git add .
git commit -m "add test"
git push test master

# Remote clone
git clone user@machine:/home/user/Source/PrivateGit/test