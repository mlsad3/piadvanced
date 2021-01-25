#!/bin/sh
################################################################
##          This is The Deathbybandaid Pi Install         ##
################################################################
##    This Must be run as root, or it fails is some places    ##
################################################################

## Dependencies Check
sudo bash /etc/piadvanced/dependencies/dep-whiptail.sh

## These documents will contain all of our setup variables. Date/Time Stamped.
timestamp=`date --rfc-3339=seconds`
{ if 
(whiptail --title "First Run?" --yes-button "First Time!" --no-button "Not The First Time!" --yesno "Is this the First run of this install?" 10 80) 
then
sudo echo "## $timestamp" | sudo tee --append /etc/piadvanced/install/variables.conf /etc/piadvanced/install/firewall.conf
else
sudo mv /etc/piadvanced/install/variables.conf /etc/piadvanced/install/firewall.conf /etc/piadvanced/backups/
sudo echo "## $timestamp" | sudo tee --append /etc/piadvanced/install/variables.conf /etc/piadvanced/install/firewall.conf
fi }

## Here we Go!!
echo "This is The Deathbybandaid Pi Install" > herewego_textbox
whiptail --textbox --title "Let's Start!" herewego_textbox 10 80
rm *_textbox

## Hostname
sudo bash /etc/piadvanced/modules/hostname.sh

## Static IP for eth0
sudo bash /etc/piadvanced/modules/eth0.sh

# vlan
sudo bash /etc/piadvanced/modules/virtualinterface.sh

## Wifi Credentials
sudo bash /etc/piadvanced/modules/wifissid.sh

## Staic IP for wlan0
sudo bash /etc/piadvanced/modules/wlan0.sh

## Memory Split
sudo bash /etc/piadvanced/modules/memorysplit.sh

## Total Mem Tweak
sudo bash /etc/piadvanced/modules/totalmemtweak.sh

## Swap space tweak
sudo bash /etc/piadvanced/modules/swapspacetweak.sh

## zram-config
sudo bash /etc/piadvanced/modules/zramconfig.sh

## SSH
sudo bash /etc/piadvanced/modules/ssh.sh

## Time
sudo bash /etc/piadvanced/modules/timezone.sh
sudo bash /etc/piadvanced/modules/ntp.sh

## Random Number Generation fix
sudo bash /etc/piadvanced/modules/rngtools.sh

## Nano Line number
sudo bash /etc/piadvanced/modules/nanolinenumberhing.sh

## Better MOTD message
sudo bash /etc/piadvanced/modules/motd.sh

## HTOP
sudo bash /etc/piadvanced/modules/htop.sh

## Sources && Update && Upgrade
sudo bash /etc/piadvanced/modules/sources.sh
sudo bash /etc/piadvanced/modules/updateupgrade.sh
sudo bash /etc/piadvanced/modules/aptgetinstall.sh

## Admin Email
echo "The next Three installs are Email options. Apticron, Mailutils, and Exim4" > adminmail_textbox
whiptail --textbox --title "Email Options" adminmail_textbox 10 80
rm *_textbox

## Apticron
sudo bash /etc/piadvanced/modules/apticron.sh

## Mail
sudo bash /etc/piadvanced/modules/mailutils.sh

## Exim4
sudo bash /etc/piadvanced/modules/exim4.sh

## Get an email when External IP Address Changes
sudo bash /etc/piadvanced/modules/externalipchangeemail.sh

## DNSmasq
sudo bash /etc/piadvanced/modules/dnsmasq.sh

## Fail2Ban
sudo bash /etc/piadvanced/modules/fail2ban.sh

## PSAD
sudo bash /etc/piadvanced/modules/psad.sh

## samba
sudo bash /etc/piadvanced/modules/sambashare.sh

## Dynamic Update Clients
echo "The next Three installs are dynamic update clients for No-IP, Dyndns, and DuckDNS" > ducs_textbox
whiptail --textbox --title "Dynamic Update Options" ducs_textbox 10 80
rm *_textbox

## No-ip Dynamic Update Client
sudo bash /etc/piadvanced/modules/noip.sh

## Dyndns
sudo bash /etc/piadvanced/modules/ddclient.sh

## DuckDNS
sudo bash /etc/piadvanced/modules/duckdns.sh

## VPNs
echo "The next two installs are openvpn and pivpn" > vpns_textbox
whiptail --textbox --title "VPN Options" vpns_textbox 10 80
rm *_textbox

## OpenVPN
sudo bash /etc/piadvanced/modules/openvpn.sh

## pivpn
sudo bash /etc/piadvanced/modules/pivpn.sh

## Pi-Hole
sudo bash /etc/piadvanced/modules/pihole.sh

## Pi-hole Tweaks
if 
[ -d "/etc/pihole/" ] 
then
sudo bash /etc/piadvanced/modules/pihole-tweaks.sh
else
:
fi

## DNSCrypt
sudo bash /etc/piadvanced/modules/dnscrypt.sh

## Webserver settings
echo "Let's modify the webserver configurations. Users of Pi-Hole, may need to look at the Lighttpd settings." > webserver_textbox
whiptail --textbox --title "Webserver Questions Ahead" webserver_textbox 10 80
rm *_textbox
sudo bash /etc/piadvanced/modules/lighttpd.sh
sudo bash /etc/piadvanced/modules/apache.sh
sudo bash /etc/piadvanced/modules/nginx.sh

## Usermin
sudo bash /etc/piadvanced/modules/usermin.sh

## Webmin
sudo bash /etc/piadvanced/modules/webmin.sh

## xRDP
sudo bash /etc/piadvanced/modules/xrdp.sh

## shellinabox
sudo bash /etc/piadvanced/modules/shellinabox.sh

## Guacamole
sudo bash /etc/piadvanced/modules/guacamole.sh

## CUPS
sudo bash /etc/piadvanced/modules/cups.sh

## rpimonitor
sudo bash /etc/piadvanced/modules/rpimonitor.sh

## phpmyadmin
sudo bash /etc/piadvanced/modules/phpmyadmin.sh

## nagios
sudo bash /etc/piadvanced/modules/nagios.sh

## Proxies
echo "The next two installs are Squid and Privoxy, choose one ONLY!" > proxies_textbox
whiptail --textbox --title "Proxies" proxies_textbox 10 80
rm *_textbox

## Privoxy
sudo bash /etc/piadvanced/modules/privoxy.sh

## Squid
sudo bash /etc/piadvanced/modules/squid.sh

## nxfilter
sudo bash /etc/piadvanced/modules/nxfilter.sh

## Speedtest tweet
sudo bash /etc/piadvanced/modules/speedtesttweet.sh

## vesta
sudo bash /etc/piadvanced/modules/vesta.sh

## HASS
sudo bash /etc/piadvanced/modules/hass.sh

## Grafana
sudo bash /etc/piadvanced/modules/grafana.sh

## openvas
echo "Warning: The OpenVas install (next) is untested." > openvas_textbox
whiptail --textbox --title "OpenVas" openvas_textbox 10 80
rm *_textbox
sudo bash /etc/piadvanced/modules/openvas.sh

## plexboard
sudo bash /etc/piadvanced/modules/plexboard.sh

## HTPC
sudo bash /etc/piadvanced/modules/atomic.sh

## Dplatform
sudo bash /etc/piadvanced/modules/dplatform.sh

## THE FIREWALL!!
sudo bash /etc/piadvanced/FIREWALL.sh

## All Done
echo "This concludes the script. Reboot to complete. Consult the readme for additional configuration." > completed_textbox
whiptail --textbox --title "Completed" completed_textbox 10 80
rm *_textbox
