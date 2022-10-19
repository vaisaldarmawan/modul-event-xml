#!/bin/bash
cd ~
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:jczaplicki/xenial-php74-temp
sudo apt-get update
sudo add-apt-repository -y ppa:tomvlk/php-archive
sudo apt-get update
sudo apt-get install -y php7.4
sudo apt-get install -y php7.4-cli php7.4-xml
sudo apt-get install -y git

git clone https://github.com/vaisaldarmawan/regionalisasi
cd regionalisasi
chmod +x modul-event/check-xml.sh
chmod +x modul-file/check-folder.sh


service cron stop
line1="*/1 * * * * cd ~/regionalisasi/modul-event && sh check-xml.sh"
line2="*/1 * * * * cd ~/regionalisasi/modul-file && sh check-folder.sh"
(crontab -u $(whoami) -l; echo "$line1" ) | crontab -u $(whoami) -
(crontab -u $(whoami) -l; echo "$line2" ) | crontab -u $(whoami) -


git clone https://github.com/sukmacakrawala/monitoring-seiscomp3
mv -r monitoring-seiscomp3 remote_site
chmod +x remote_site/seischeck.sh

line3="1 * * * * ~/remote_site/seischek.sh"
(crontab -u $(whoami) -l; echo "$line3" ) | crontab -u $(whoami) -
