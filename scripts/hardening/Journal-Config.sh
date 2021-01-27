#Written by John Limb 1/21
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

# Next up we configure Journald
echo "######## Configure Journald - ########"
sed -i -r 's/#ForwardToSyslog=yes/ForwardToSyslog=yes/g' /etc/systemd/journald.conf
sed -i -r 's/#Compress=yes/Compress=yes/g' /etc/systemd/journald.conf
sed -i -r 's/#Storage=auto/Storage=persistent/g' /etc/systemd/journald.conf