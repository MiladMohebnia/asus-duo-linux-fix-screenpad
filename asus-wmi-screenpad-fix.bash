#!/bin/bash

# Detect latest kernel version
latest_kernel_version=$(uname -r)

# cd to the directory
cd /lib/modules/$latest_kernel_version/kernel/drivers/platform/x86

# Rename files
sudo mv asus-nb-wmi.ko asus-nb-wmi.ko_bak
sudo mv asus-wmi.ko asus-wmi.ko_bak

# Depmod
sudo depmod -a

# Create blacklist
echo "blacklist mdf_aaeon" | sudo tee /etc/modprobe.d/aaeon-blacklist.conf

# Update initramfs
sudo update-initramfs -k all -u

# Remove previous installation
sudo dkms remove -m asus-wmi -v 1.0 --all
sudo rm -r /usr/src/asus-wmi-1.0

# Follow the instructions for installation
sudo mkdir /usr/src/asus-wmi-1.0
cd /usr/src/asus-wmi-1.0
sudo wget 'https://github.com/Plippo/asus-wmi-screenpad/archive/master.zip'
sudo unzip master.zip
sudo mv asus-wmi-screenpad-master/* .
sudo rmdir asus-wmi-screenpad-master
sudo rm master.zip

sudo sh prepare-for-current-kernel.sh

sudo dkms add -m asus-wmi -v 1.0
sudo dkms build -m asus-wmi -v 1.0
sudo dkms install -m asus-wmi -v 1.0

# Reboot
sudo reboot
