#!/bin/bash

SERVERS=(
    "icanhazip.com"
    "ident.me" 
    "ipecho.net/plain"
    "whatismyip.akamai.com"
    "checkip.amazonaws.com"
)

for server in "${SERVERS[@]}"; do
    echo "Trying $server..."
    ip=$(wget -qO- --timeout=5 "$server")
    
    # Проверяем что это валидный IP адрес
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "Your IP: $ip (from $server)"
        new_ip=$ip
        break
    else
    	ip=
    fi
done

if [[ ! $new_ip ]]; then
	echo "Could not determine IP address"
	exit 1
fi

read last_ip < last_IP.txt
read new_ip < index.html
echo "last_ip: ${last_ip}"
echo "new_ip: ${new_ip}"

echo $new_ip > last_IP.txt
#echo $(date) >> wrote.txt
echo "[RSERVER](http://$new_ip)" > README.md
#git add README.md
git commit -a -m "Upd IP"
git push

