#!/bin/bash
#Written by John Limb Jan 2021
#Creating a simple bash menu to aid use of linux build
##---------------------------
#setting variable to auto exit on error 
set -eo pipefail  
#Checking if you are root.. if not then you will get error
echo Checking that you are root...
#sleeping
sleep .5
if [[ $(id -u) -ne 0 ]] ; then echo "UH OH! you are not root! Please run me as root!" ; exit 1 ; fi

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
PS3='Choose your option: '
options=("Join-domain" "Install apps" "Harden machine" "Quit")
select opt in "${options[@]}"; do
    case $opt in
    "Join-domain")
        echo "Calling Script to Join domain"
        sleep .10
        ./scripts/Join-Domain.sh
        ;;
    "Install apps")
        echo "Calling Script to install applications."
        # optionally call a function or run some code here
        sleep .5
        ;;
    "Harden machine")
        echo "Calling Script to harden machine."
        # optionally call a function or run some code here
        ;;
    "Quit")
        echo "Exiting, byee!"
        exit
        ;;
    *) echo -e "${red}invalid option $REPLY" ${reset} ;;
    esac
done
