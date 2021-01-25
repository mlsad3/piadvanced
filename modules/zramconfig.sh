#!/bin/sh
## zram-config
NAMEOFAPP="zram-config" # This helps set the name of your app throught the module.
WHATITDOES="This sets your /var/log and swap to RAM using zram-config. Edit /etc/ztab if any configuration changes are needed."

## Current User
CURRENTUSER="$(whoami)"

## Dependencies Check
sudo bash /etc/piadvanced/dependencies/dep-whiptail.sh

## Variables (if in every file, an installer can be re-run independently)
source /etc/piadvanced/install/firewall.conf
source /etc/piadvanced/install/variables.conf
source /etc/piadvanced/install/userchange.conf

{ if 
(whiptail --title "$NAMEOFAPP" --yes-button "Skip" --no-button "Proceed" --yesno "Do you want to setup $NAMEOFAPP? $WHATITDOES" 10 80) 
then
echo "$CURRENTUSER Declined $NAMEOFAPP" | sudo tee --append /etc/piadvanced/install/installationlog.txt
echo ""$NAMEOFAPP"install=no" | sudo tee --append /etc/piadvanced/install/variables.conf
else
echo "$CURRENTUSER Accepted $NAMEOFAPP" | sudo tee --append /etc/piadvanced/install/installationlog.txt
echo ""$NAMEOFAPP"install=yes" | sudo tee --append /etc/piadvanced/install/variables.conf

## Below here is the magic.
sudo git clone --recurse-submodules https://github.com/ecdye/zram-config /etc/piadvanced/installscripts/zram-config
cd /etc/piadvanced/installscripts/zram-config
sudo ./install.bash
sudo zram-config stop
sudo sed -i 's/\s*\/opt\/zram\/oldlog\s*$//' /etc/ztab
sudo systemctl restart zram-config.service
zramctl
## End of install
fi }

## Unset Temporary Variables
unset NAMEOFAPP
unset CURRENTUSER
unset WHATITDOES

## Module Comments
