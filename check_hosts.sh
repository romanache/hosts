#!/bin/bash

while read -r ip names; do
    if [[ -z "$ip" || "$ip" == \#* ]]; then 
        continue
    fi

    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "IP valid: $ip pentru $names"
    else
        echo "IP invalid: $ip"
    fi
done < /etc/hosts
