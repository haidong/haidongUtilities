#!/bin/bash
rsync -zr user@www.myhost.com:/home/user/public_html/ /home/user/blogBackup/public_html/
ssh user@www.myhost.com "mysqldump -q -e -hlocalhost -ulogin -ppassword dbname | gzip - > ~/db_backup_`date '+%Y_%m_%d'`.sql.gz"
scp user@www.myhost.com:/home/user/db_backup_`date '+%Y_%m_%d'`.sql.gz /home/user/blogBackup/
ssh user@www.myhost.com "rm -f ~/db_backup_`date '+%Y_%m_%d'`.sql.gz"
find /home/user/blogBackup/db_backup_* -mtime +5 -exec rm {} \;
