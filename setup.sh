#!/bin/bash

# Set Splunk installation parameters
SPLUNK_TGZ_URL="https://download.splunk.com/products/splunk/releases/9.0.4.1/linux/splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz"
SPLUNK_TGZ_FILE="splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz"
SPLUNK_INSTALL_DIR="/opt/splunk"
ADMIN_USERNAME="admin"
ADMIN_PASSWORD="abcd1234"

# Update the system and install required packages
sudo yum update -y
sudo yum install -y wget

# Download and extract Splunk
sudo wget -O "$SPLUNK_TGZ_FILE" "$SPLUNK_TGZ_URL"
sudo tar -zxvf "$SPLUNK_TGZ_FILE" -C /opt

# Start Splunk and accept the license
sudo "$SPLUNK_INSTALL_DIR/bin/splunk" start --accept-license --answer-yes --no-prompt

# Change the admin password
sudo "$SPLUNK_INSTALL_DIR/bin/splunk" edit user "$ADMIN_USERNAME" -password "$ADMIN_PASSWORD" -auth admin:changeme

# Enable Splunk to start at boot
sudo "$SPLUNK_INSTALL_DIR/bin/splunk" enable boot-start

# Clean up the downloaded Splunk package
rm -f "$SPLUNK_TGZ_FILE"

#echo "Splunk installation completed."

