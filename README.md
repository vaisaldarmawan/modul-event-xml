# Pre-installasi
1. Pastikan dahulu shell anda menggunakan bash dengan command `` $ls -l `which sh` ``.
2. Apabila outputnya `/bin/sh -> bash`, abaikan langkah pre-installasi selanjutnya dan langsung ke langkah `Installasi`.
3. Apabila outputnya `/bin/sh -> dash`, Ubah dahulu shell dari dash ke bash dengan command `$sudo dpkg-reconfigure dash`, Lalu pilih `NO`

# Installasi
1. Download file `install.sh` dengan command `$wget https://raw.githubusercontent.com/vaisaldarmawan/regionalisasi/main/install.sh`
2. Jalankan program Install.sh dengan command `$sh install.sh` dan tunggu hingga proses installasi selesai.
3. Edit konfigurasi file sesuai dengan UPT masing-masing di `~/regionalisasi/config.cfg`
4. Jalankan crontab dengan command `$service cron start`
