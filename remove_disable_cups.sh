#!/bin/bash

# Stop the CUPS service
sudo systemctl stop cups

# Disable the CUPS service
sudo systemctl disable cups

# Remove the CUPS package and its dependencies
sudo apt remove --purge cups -y

# Remove any residual configuration files
sudo apt purge $(dpkg -l | grep '^rc' | awk '{print $2}') -y

# Clean up any leftover CUPS directories and files
sudo rm -rf /etc/cups
sudo rm -rf /var/spool/cups
sudo rm -rf /var/run/cups
sudo rm -rf /var/cache/cups

# Autoremove unnecessary packages
sudo apt autoremove -y

echo "CUPS (Common Unix Printing System) has been removed and disabled."
