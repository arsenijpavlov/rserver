#!/bin/bash

wget ifconfig.ru
if [[ $? != 0 ]]; then
  echo "wget return $?";
  exit;
fi

read last_ip < last_IP.txt;
read new_ip < index.html;
if [[ $new_ip && $new_ip != $last_ip ]]; then
  echo $new_ip > last_IP.txt;
  echo $(date) >> wrote.txt
  echo "[RSERVER](http://$new_ip)" > README.md;
  git add README.md;
  git commit -m "Upd IP";
  git push;
fi

rm index.html*;
