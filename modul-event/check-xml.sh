#!/bin/bash
source /home/sysop/regionalisasi/config.cfg

if [ "$lokasi_xml" -nt "event2.xml" ]; then
  echo "Ada File event.xml baru!!"
  cp $lokasi_xml event2.xml
  (echo -e "") >> tmp.log
  (echo -n $(date +"[%d%m%Y - %H:%M:%S]") && echo -n " " && sed -n '27p' $lokasi_xml) >> tmp.log
  (php check-xml.php "$nama_upt") >> tmp.log
  sed '1!G;h;$!d' tmp.log > event.log

else
  echo "Tidak ada perubahan pada file"
fi
