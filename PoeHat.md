### Raspberry Pi 4 PoE Hat Fan Speed Control
https://blog.leandrotoledo.org/raspberry-pi-4-poe-hat-fan-speed-control/

### Taking control of the Pi PoE HAT's overly-aggressive fan
https://www.jeffgeerling.com/blog/2021/taking-control-pi-poe-hats-overly-aggressive-fan

https://github.com/raspberrypi/linux/issues/2715

1. SSH into your pi

2. Navigate to the boot directory by using the command
   `cd /boot`

3. Open the config.txt file in nano by using the command
   `sudo nano config.txt`

4. Use the down arrow to go to the bottom of this file.

5. Add these 5 lines changing the temp to whatever you prefer. Noting 65 Degrees Celsius = 65000. In addition, the fan has 4 speeds this just sets at what temperatures the fan speed changes. I wanted it to be super silent so my temperature targets are very aggressive. Running a Unifi controller for 5 months with occasional 40 degree Celsius days with no issues so far.
   `# PoE Hat Fan Speeds`
   `dtparam=poe_fan_temp0=65000`
   `dtparam=poe_fan_temp1=70000`
   `dtparam=poe_fan_temp2=75000`
   `dtparam=poe_fan_temp3=80000`

6. Press 'Control+X' on your keyboard to exit

7. Press 'Y' on your keyboard to agree to overwriting the file

8. Press 'Enter' to confirm

9. This will close the nano text editor

10. reboot your pi  using the command
    `sudo reboot`

11. The fan should work with your new settings now