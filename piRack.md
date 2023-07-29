### SKU_RM0004
https://github.com/UCTRONICS/SKU_RM0004

sudo nano /boot/config.txt file

dtoverlay=gpio-shutdown,gpio_pin=4,active_low=1,gpio_pull=up

git clone https://github.com/UCTRONICS/SKU_RM0004.git

cd SKU_RM0004

chmod +x display

sudo nano /etc/rc.local

# Setup display
printf "Starting LCD"
/home/mdelgert/source/SKU_RM0004/display