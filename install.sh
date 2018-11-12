#!/bin/sh

# Python 3
apt-get install python3 -y
apt-get install python3-pip -y

# Development dependencies
apt-get install libatlas-base-dev -y
apt-get install flac -y
apt-get install git -y

# Local Speech recognition dependencies
apt-get install libhdf5-serial-dev -y
apt-get install swig -y
apt-get install pulseaudio -y
apt-get install libpulse-dev -y
apt-get install libasound2-dev -y

# Artificial inteligence package
git clone https://github.com/aiforiot/artificial_inteligence.git
pip3 install -r artificial_intelligence/requeriments.txt -y
pip3 install -r local_keyword_detection/requeriments.txt -y

#Raspberry setup for AP https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md
sudo apt update
sudo apt-get install dnsmasq hostapd
sudo systemctl stop dnsmasq
sudo systemctl stop hostapd

#sudo reboot

# Configurar DHCP
sudo echo "interface wlan0
    static ip_address=192.168.5.1/24
    nohook wpa_supplicant" >> /etc/dhcpcd.conf

sudo service dhcpcd restart

sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
sudo echo "interface=wlan0      # Use the require wireless interface - usually wlan0
  dhcp-range=192.168.5.2,192.168.5.100,255.255.255.0,infinite" >> /etc/dnsmasq.conf
  
sudo echo "interface=wlan0
driver=nl80211
ssid=NameOfNetwork
hw_mode=g
channel=7
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=AardvarkBadgerHedgehog
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP" > /etc/hostapd/hostapd.conf

sed -i 's/#DAEMON_CONF/DAEMON_CONF/g' /etc/default/hostapd

sudo reboot
