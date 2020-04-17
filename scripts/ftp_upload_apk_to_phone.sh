#!/bin/bash
. ~/ftp_upload_apk_to_phone.env
for HOST in $HOSTS; do
echo "attempting ftp upload to host $HOST"
ftp -inv $HOST $PORT <<EOF
user $USER $PASSWORD
binary
lcd /home/aplicatii-romanesti
cd Download
mput branch_bibliotecaortodoxa_version_*_at_*.apk
bye
EOF

done
