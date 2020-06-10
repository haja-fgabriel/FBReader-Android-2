#!/bin/bash -x
REL_FILE_NAMES=$@
# If no param, defaulting to:
REL_FILE_NAMES=${REL_FILE_NAMES:-"branch_x_latest.apk"}
. ~/ftp_upload_apk_to_phone.env

for HOST in $HOSTS; do
  echo "attempting ftp upload to host $HOST"

  for REL_FILE_NAME in $REL_FILE_NAMES ; do
  ftp -inv $HOST $PORT <<EOF
    user $USER $PASSWORD
    binary
    lcd /home/aplicatii-romanesti
    cd Download
    mput $REL_FILE_NAME
    bye
EOF
  #put branch_bibliotecaortodoxa_version_*_at_*.apk
 done

done
