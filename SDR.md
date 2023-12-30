# Links
https://airspy.com/download/
https://github.com/rtlsdrblog/rtl-sdr-blog
https://www.radioreference.com/db/browse/coid/1
http://www.csgnetwork.com/antennaedcalc.html
https://github.com/shajen/rtl-sdr-scanner-cpp
https://www.rtl-sdr.com/V4/
https://www.rtl-sdr.com/using-our-new-dipole-antenna-kit/

# Videos
https://www.youtube.com/watch?v=C01wLvwjLIs&list=PLC5hLl1wqo4272U2B2L52L6BcBIdBci8E&index=1&t=939s&pp=gAQBiAQB
https://www.youtube.com/watch?v=h4x7cGALaC8&list=PLC5hLl1wqo4272U2B2L52L6BcBIdBci8E&index=2&t=335s
https://www.youtube.com/watch?v=1Em3TvCb2BY&list=PLC5hLl1wqo4272U2B2L52L6BcBIdBci8E&index=3&t=1067s&pp=gAQBiAQB
https://www.youtube.com/watch?v=YzQ2N0VkKvE&t=34s
https://www.youtube.com/watch?v=xGEDglwOHng

# Setup driver
```bash
sudo apt update
sudo apt install libusb-1.0-0-dev git cmake pkg-config
git clone https://github.com/rtlsdrblog/rtl-sdr-blog
cd rtl-sdr-blog/
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/
sudo ldconfig
echo 'blacklist dvb_usb_rtl28xxu' | sudo tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf
``` 
 
# Server Network with Raspberry Pi
```bash
wget -O spyserver.tgz http://airspy.com/?ddownload=5795
tar xvzf spyserver.tgz
```

# Set RTL SDR Serial Number
```bash
rtl_eeprom
rtl_eeprom -s 00000002
```