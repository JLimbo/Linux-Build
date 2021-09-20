#!/bin/bash
#Written by John Limb Jan 2021
#Rational: set up tuning profiles on linux 
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

printf "\\n"
printf "    Installing tuned to help improve system performance and battery life\\n"
printf "\\n"
printf "\\n"

sudo apt update
sudo apt install tuned tuned-utils tuned-systemtap

printf "\\n"
printf "    Checking tuned is running \n"
printf "\\n"
printf "\\n"

sudo systemctl status tuned
sleep.5

printf "\\n"
printf "    Setting Balanced profile \\n"
printf " \\n"
printf "\\n"

sudo tuned-adm profile balanced

