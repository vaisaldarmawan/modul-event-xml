<?php

// Konfigurasi file event.xml
$nama_upt = shell_exec('source /home/server/pacul/config.cfg && echo "$nama_upt"');
$lokasi_xml = shell_exec('source /home/server/pacul/config.cfg && echo "$lokasi_xml"');
$db_ip = shell_exec('source /home/server/pacul/config.cfg && echo "$db_ip"');
$db_port = shell_exec('source /home/server/pacul/config.cfg && echo "$db_port"');
$db_name = shell_exec('source /home/server/pacul/config.cfg && echo "$db_name"');
$db_username = shell_exec('source /home/server/pacul/config.cfg && echo "$db_username"');
$db_password = shell_exec('source /home/server/pacul/config.cfg && echo "$db_password"');

// Konfigurasi Parsing File intensity_logo.jpg atau intensity_MMI_logo.jpg
$target_ip_ssh = shell_exec('source /home/server/pacul/config.cfg && echo "$target_ip_ssh"');
$target_user_ssh = shell_exec('source /home/server/pacul/config.cfg && echo "$target_user_ssh"');
$target_port_ssh = shell_exec('source /home/server/pacul/config.cfg && echo "$target_port_ssh"');
$dir_sumber_data = shell_exec('source /home/server/pacul/config.cfg && echo "$dir_sumber_data"');
$dir_target_data = shell_exec('source /home/server/pacul/config.cfg && echo "$dir_target_data"');
$nama_jpg = shell_exec('source /home/server/pacul/config.cfg && echo "$nama_jpg"');
$nama_sensor = shell_exec('source /home/server/pacul/config.cfg && echo "$nama_sensor"');


//Output

echo "$nama_upt";
echo "$lokasi_xml";
echo "$db_ip";
echo "$db_port";
echo "$db_name";
echo "$db_username";
echo "$db_password";
			
echo "$target_ip_ssh";
echo "$target_user_ssh";
echo "$target_port_ssh";
echo "$dir_sumber_data";
echo "$dir_target_data";
echo "$nama_jpg";
echo "$nama_sensor";
?>
