#!/bin/bash
source ~/regionalisasi/config.cfg

rsync -avuzr --out-format="%t %f" --timeout=60 --include="*/" --include=""$folder_jpg/$nama_jpg"" --include=""$folder_sensor/$nama_sensor"" --include=""$folder_zip/$nama_zip"" --exclude="*" --exclude=""$nama_zip.""  -e "ssh -p $target_port_ssh" $dir_sumber_data $target_user_ssh@$target_ip_ssh:$dir_target_data/$nama_upt
