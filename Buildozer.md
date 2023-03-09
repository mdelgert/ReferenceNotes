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


https://github.com/kivy/buildozer/issues/985

Build basic image:
$ cd
$ git clone https://github.com/kivy/buildozer
$ cd buildozer
$ docker build --tag=buildozer .
$ docker run --volume "$(pwd)":/home/user/hostcwd buildozer --version
Create a project:
[pong]$ docker run --volume "$(pwd)":/home/user/hostcwd buildozer init
Edit buildozer.spec:
android.accept_sdk_license = True
Build:
[pong]$ docker run --volume "$(pwd)":/home/user/hostcwd buildozer android debug
Check the containers:
$ docker ps -a
Commit the container where the successful build happened, like this:
$ docker commit angry_black tyrn/buildozer:propio
$ docker images
The resulting image is about 5GB.

Run it like this on any project:
$ docker run --volume "$(pwd)":/home/user/hostcwd tyrn/buildozer:propio android debug