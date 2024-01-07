#!/bin/bash

# Remove unattended-upgrades package
sudo apt remove unattended-upgrades -y

# Disable the systemd service
sudo systemctl stop unattended-upgrades
sudo systemctl disable unattended-upgrades

# Lock the package to prevent reinstallation or updates
echo "unattended-upgrades hold" | sudo dpkg --set-selections

# Purge residual configuration files
sudo apt purge $(dpkg -l | grep '^rc' | awk '{print $2}') -y

# Remove log files
sudo rm -rf /var/log/unattended-upgrades

# Autoremove unnecessary packages
sudo apt autoremove -y

echo "Unattended upgrades have been removed and disabled, and unnecessary packages have been autoremoved."
