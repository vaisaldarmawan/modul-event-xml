#!/bin/bash
cd
reset
echo " >> Proses Installasi akan segera dimulai . . ."
sleep 1s

echo " >> Menyiapkan Repository . . ."
sudo apt install -y software-properties-common > /dev/null 2>&1
sudo add-apt-repository -y ppa:tomvlk/php-archive > /dev/null 2>&1
sudo add-apt-repository -y ppa:jczaplicki/xenial-php74-temp > /dev/null 2>&1

echo " >> Update Repository & Package . . ."
sudo apt-get update > /dev/null 2>&1

echo " >> Menginstall php7.4, php7.4-cli, php7.4-xml, php7.4-mysql . . ."
sudo apt-get install -y php7.4 > /dev/null 2>&1
sudo apt-get install -y php7.4-cli php7.4-xml php7.4-mysql > /dev/null 2>&1

echo " >> Menginstall git . . ."
sudo apt-get install -y git > /dev/null 2>&1

echo " >> Menghentikan Service Crontab . . ."
sudo service cron stop > /dev/null 2>&1

cd
echo " >> Mengunduh & Menginstall File Regionalisasi . . ."
git clone https://github.com/vaisaldarmawan/regionalisasi > /dev/null 2>&1
rm -rf regionalisasi/.git

cd regionalisasi
chmod +x modul-event/check-xml.sh
chmod +x modul-file/check-folder.sh

echo " >> Memasukan command kedalam crontab . . ."
line1="*/1 * * * * cd ~/regionalisasi/modul-event && sh check-xml.sh"
line2="*/1 * * * * cd ~/regionalisasi/modul-file && sh check-folder.sh"
(crontab -u $(whoami) -l; echo "$line1" ) | crontab -u $(whoami) -
(crontab -u $(whoami) -l; echo "$line2" ) | crontab -u $(whoami) -

cd

echo " >> Mengunduh File Monitoring . . ."
git clone https://github.com/sukmacakrawala/monitoring-seiscomp3 > /dev/null 2>&1
rm -rf monitoring-seiscomp3/.git
mv monitoring-seiscomp3 remote_site
chmod +x remote_site/seischeck.sh

echo " >> Memasukan command kedalam crontab . . ."
line3="1 * * * * ~/remote_site/seischek.sh"
(crontab -u $(whoami) -l; echo "$line3" ) | crontab -u $(whoami) -

echo "Installasi Selesai !!"
