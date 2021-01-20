#!/bin/bash
#Written by John Limb Jan 2021
#Creating a simple bash menu to aid use of linux build
##---------------------------
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
    *) echo "invalid option $REPLY" ;;
    esac
done
