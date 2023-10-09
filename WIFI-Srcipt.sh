#!/bin/bash

# Check for superuser privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root. Please use sudo."
  exit 1
fi

# Disable [interface_name] interface
echo "Disabling [interface_name] interface..."
ifconfig [interface_name] down

# Change the MAC address of [interface_name]
echo "Changing the MAC address of ..."
macchanger -r [interface_name]

# Enable [interface_name] interface
echo "Enabling [interface_name] interface..."
ifconfig  up

# Run wifite
echo "Running wifite..."
wifite

# Disable monitor mode
echo "Disabling monitor mode..."
airmon-ng stop [interface_name]

# Script complete
echo "Script execution complete."

