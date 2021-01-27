#Written by John Limb 1/21
#Rational: Randomly placing virtual memory regions is an exploit mitigation technique to randomly arrange the address space of key data areas within a process. 
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

echo "######Enable Address Space Layout randomisation######"

echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf

sysctl -w kernel.randomize_va_space=2
