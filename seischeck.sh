#!/bin/bash
source /home/sysop/regionalisasi/config.cfg

kode_stasiun=$nama_upt
tipe=$tipe_pc
hdd=$(df / | awk 'NR==2 {print $5}' | sed 's/\%//g')
datetime=$(date +"%Y-%m-%d %H:%m")
id=$(date +"%Y%m%d%H%m")

cd $dir_file

declare -a modul
if [ $tipe == "seiscomp" ]
then
   export modul=(spread scmaster arclink scwfparam seedlink slarchive)
else
   export modul=(spread scmaster arclink scwfparam)
fi


for i in "${modul[@]}"
do
##start looping
if [[ $(runuser -l sysop -c 'seiscomp status' | grep -w $i | awk '{print $3}') == 'not' ]]
 then
  export $i=0
 else
 export  $i=1
fi
##stop looping
done



if [ $tipe == "seiscomp" ]
then
   let status=$spread+$scmaster+$arclink+$scwfparam+$seedlink+$slarchive
   sql="INSERT INTO tbl_mon_harian (id,kode_stasiun,tipe,hdd,waktu,status_spread,status_scmaster,status_arclink,status_scwfparam,status_seedlink,status_slarchive ) VALUES ('$id','$kode_stasiun','$tipe','$hdd','$datetime','$spread','$scmaster','$arclink','$scwfparam','$seedlink','$slarchive'); UPDATE tbl_mon_tampil SET scmp = $status , hdd_scmp = $hdd  WHERE kode_stasiun='$kode_stasiun';"
else
   let status=$spread+$scmaster+$scwfparam
   sql="INSERT INTO tbl_mon_harian (id,kode_stasiun,tipe,hdd,waktu,status_spread,status_scmaster,status_scwfparam ) VALUES ('$id','$kode_stasiun','$tipe','$hdd','$datetime','$spread','$scmaster','$scwfparam'); UPDATE tbl_mon_tampil SET shake = $status , hdd_shake = $hdd  WHERE kode_stasiun='$kode_stasiun';"
fi

mysql -u $db_username --password=$db_password --database="$db_name" -h $db_ip -P $db_port --execute="$sql"


echo $(date) >> log.txt

