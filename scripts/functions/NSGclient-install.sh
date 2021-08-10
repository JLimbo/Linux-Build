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
printf "    Downloading prerequesites for NSG client    \\n"