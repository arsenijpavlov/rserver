#!/bin/bash

echo "wget ifconfig"
rm -f index.html
wget ifconfig.com #.ru перестал работать...
if [[ $? != 0 ]]; then
  echo "wget return $?";
  exit;
fi

read last_ip < last_IP.txt
read new_ip < index.html
echo "last_ip: ${last_ip}"
echo "new_ip: ${new_ip}"
#echo $(date) >> wrote.txt
#if [[ $new_ip && $new_ip != $last_ip ]]; then
  echo $new_ip > last_IP.txt;
  #echo $(date) >> wrote.txt
  echo "[RSERVER](http://$new_ip)" > README.md;
  git add README.md;
  git commit -m "Upd IP";
  git push;
#else
#  echo "nothing update";
#fi

rm index.html*;
