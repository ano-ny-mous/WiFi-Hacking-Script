#!/bin/bash

# Check for superuser privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root. Please use sudo."
  exit 1
fi

# Disable wlx5091e31bc505 interface
echo "Disabling wlx5091e31bc505 interface..."
ifconfig wlx5091e31bc505 down

# Change the MAC address of wlx5091e31bc505
echo "Changing the MAC address of ..."
macchanger -r wlx5091e31bc505

# Enable wlx5091e31bc505 interface
echo "Enabling wlx5091e31bc505 interface..."
ifconfig  up

# Run wifite
echo "Running wifite..."
wifite

# Script complete
echo "Script execution complete."

