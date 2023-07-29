### Raspberry Pi 4 PoE Hat Fan Speed Control
https://blog.leandrotoledo.org/raspberry-pi-4-poe-hat-fan-speed-control/

### Taking control of the Pi PoE HAT's overly-aggressive fan
https://www.jeffgeerling.com/blog/2021/taking-control-pi-poe-hats-overly-aggressive-fan
https://github.com/raspberrypi/linux/issues/2715
https://github.com/raspberrypi/firmware/issues/1689

sudo nano /boot/config.txt

# PoE Hat Fan Speed 1
dtparam=poe_fan_temp0=35000
dtparam=poe_fan_temp1=36000
dtparam=poe_fan_temp2=37000
dtparam=poe_fan_temp3=38000

# PoE Hat Fan Speeds 2 
dtparam=poe_fan_temp0=50000
dtparam=poe_fan_temp1=54000
dtparam=poe_fan_temp2=58000
dtparam=poe_fan_temp3=62000

# PoE Hat Fan Speeds 3
dtparam=poe_fan_temp0=50000
dtparam=poe_fan_temp1=60000
dtparam=poe_fan_temp2=70000
dtparam=poe_fan_temp3=80000