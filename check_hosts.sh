#!/bin/bash

check_dns() {
    local host=$1
    local ip=$2
    local dns_server=$3
    
    local resolved_ip=$(dig @"$dns_server" +short "$host" | tail -n1)
    
    if [[ "$resolved_ip" == "$ip" ]]; then
        echo "OK: $host rezolva la $ip"
    else
        echo "FAIL: $host nu rezolva la $ip prin $dns_server"
    fi
}

while read -r ip host aliases; do
    if [[ -z "$ip" || "$ip" == \#* ]]; then 
        continue
    fi

    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        check_dns "$host" "$ip" "8.8.8.8"
    else
        echo "IP invalid: $ip"
    fi
done < /etc/hosts
