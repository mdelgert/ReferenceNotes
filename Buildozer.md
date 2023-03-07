https://buildozer.readthedocs.io/en/latest/installation.html#targeting-android

https://github.com/marketplace/actions/buildozer-action

https://github.com/kivy/buildozer/blob/master/Dockerfile

https://stackoverflow.com/questions/55902147/buildozer-not-finding-aidl

docker pull kivy/buildozer

docker run --volume "$(pwd)":/home/user/hostcwd buildozer android debug

/mnt/c/Source/GitHub/PythonDev/KivyTutorial/

Running buildozer in docker
https://github.com/kivy/buildozer/issues/985

$ cd
$ git clone https://github.com/kivy/buildozer
$ cd buildozer
$ docker build --tag=buildozer .
$ docker run --volume "$(pwd)":/home/user/hostcwd buildozer --version