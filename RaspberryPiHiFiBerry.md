# CONFIGURING LINUX 4.X OR HIGHER
https://www.hifiberry.com/docs/software/configuring-linux-3-18-x/

# edit config
sudo nano  /boot/config.txt

# comment line
dtparam=audio=on

# comment line
dtoverlay=vc4-fkms-v3d

# add line
dtoverlay=vc4-fkms-v3d,audio=off

# add line
dtoverlay=hifiberry-dacplusadc
