#!/bin/bash
#Written by John Limb Jan 2021
#Rational: To grab and install the everso painful Citrix NSG client for linux.. 
##---------------------------
#Set colour variables
red=$(tput setaf 1)
green=$(tput setaf 2)
reset=$(tput sgr0)
#setting variable to auto exit on error
set -eo pipefail
#Checking if you are root.. if not then you will get error
echo Checking that you are root...
#sleeping
sleep .5
if [[ $(id -u) -ne 0 ]]; then
    echo -e "${red}UH OH! you are not root! Please run me as root!"${reset}
    exit 1
fi
##########Setting PreReqs#######################
printf "\\n"
printf "    For supported OS please see %bhttps://github.com/JLimbo/Linux-Hardening%b\\n"
printf "    Downloading prerequesites for NSG client    \\n"
printf "\\n"
wget http://ftp.br.debian.org/debian/pool/main/n/network-manager/libnm-util2_1.6.2-3+deb9u2_amd64.deb http://ftp.br.debian.org/debian/pool/main/n/network-manager/libnm-glib4_1.6.2-3+deb9u2_amd64.deb
sudo apt install ./libnm-util2_1.6.2-3+deb9u2_amd64.deb ./libnm-glib4_1.6.2-3+deb9u2_amd64.deb 
sudo apt install libappindicator1 libproxy1-plugin-webkit libnl-cli-3-200
printf "\\n"
printf "    You should now be able to install NSG client 18.04 on new versions of linux\\n"