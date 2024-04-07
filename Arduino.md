# Setup
sudo apt install libfuse2 python3-pip
pip install pyserial

# Shortcut
sudo wget https://raw.githubusercontent.com/mdelgert/ReferenceNotes/main/arduino2.png /usr/share/icons/arduino2.png
sudo nano ~/.local/share/applications/arduino.desktop
sudo chmod +x ~/.local/share/applications/arduino.desktop

# Example
[Desktop Entry]
Name=Arduino
Exec=/home/mdelgert/Downloads/arduino-ide_2.3.2_Linux_64bit.AppImage
Icon=/usr/share/icons/arduinos.png
Type=Application
Categories=Development;

# Boards
https://static-cdn.m5stack.com/resource/arduino/package_m5stack_index.json