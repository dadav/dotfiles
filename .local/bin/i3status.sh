#!/bin/bash

i3status -c /home/ddavid/.config/i3status/config | while :
do
    read -r line
    meminfo=$(grep ^Dirty /proc/meminfo | tr -s " ")
    meminfo="[{\"name\":\"\",\"markup\":\"none\",\"full_text\":\" $meminfo\"},{"
    #if systemctl is-active 'vpn@*' &>/dev/null; then
    #    service=$(systemctl list-units 'vpn@*' --no-legend --state running | cut -d" " -f1)
    #    vpn=" VPN: active ($service)"
    #    color="#00ff00"
    #else
    #    vpn=" VPN: inactive"
    #    color="#ff0000"
    #fi
    #vpn="{\"name\":\"\",\"markup\":\"none\",\"color\":\"$color\",\"full_text\":\"$vpn\"},{"
    echo -e "${line/[{/${meminfo}}" || exit 1
done
