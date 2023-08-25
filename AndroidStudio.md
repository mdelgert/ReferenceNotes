https://developer.android.com/studio/install
https://linuxopsys.com/topics/install-android-studio-on-ubuntu

wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2022.1.1.21/android-studio-2022.1.1.21-linux.tar.gz

tar -xzvf android-studio-*.tar.gz

sudo mv android-studio /opt

sudo apt install libc6 libncurses5 libstdc++6 lib32z1 libbz2-1.0

cd /opt/android-studio/bin

sudo ./studio.sh