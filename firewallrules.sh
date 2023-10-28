#! /bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Run this script as root"
	exit
fi

enable_firewall() {
	ufw limit 22/tcp
	ufw allow 80/tcp
	ufw allow 443/tcp
	#enable this if you want to use kde connect -> ufw allow 1714:1764/udp
	ufw default deny incoming
	ufw default allow outgoing
	ufw enable
	ufw reload
	ufw status
	echo "It's a good idea to reboot your system"
}

ufw_check() {
	if ! command -v ufw &>/dev/null; then
		echo "ufw not found, Installing....."
		apt update -y
		apt install ufw -y
	else
		enable_firewall
	fi
}
ufw_check
