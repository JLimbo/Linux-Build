#Written by John Limb 1/21
#Rational: Granting Write access to this directory as a non-privlged user could provide them with means for gaining unauthorized elevated permissions.
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

#Setting cron 
systemctl --now enable cron
#Setting cron permissions
chown root:root /etc/crontab
chmod og-rwx /etc/crontab

#Setting permissions on cron hourly file
chown root:root /etc/cron.hourly/
chmod og-rwx /etc/cron.hourly/

#Setting permissions on cron daily file
chown root:root /etc/cron.daily/
chmod og-rwx /etc/cron.daily/

#Setting Permisssions on cron weekly file
chown root:root /etc/cron.weekly/
chmod og-rwx /etc/cron.weekly/

#Setting permissions on cron monthly file
chown root:root /etc/cron.monthly/
chmod og-rwx /etc/cron.monthly/

#Now set permissions on Cron.D file
chown root:root /etc/cron.d/
chmod og-rwx /etc/cron.d/

#Now we lock down cron - We Remove file, so cron only checks the cron allow. only list users in there and have default deny if not listed in the allow file.
#Work will need to be done on join-domain.sh so that the user of the machine can access cron
#rm /etc/cron.deny

#Now create cron allow
touch /etc/cron.allow

#Set permissions on cron allow file 
chmod g-wx,o-rwx /etc/cron.allow
chown root:root /etc/cron.allow

#Now we lock down at - Same logic applies to cron.deny being removed.
#rm /etc/at.deny
#Create at.allow file
touch /etc/at.allow
#set permissions on at.allow
chmod g-wx,o-rwx /etc/at.allow
chown root:root /etc/at.allow