#!/bin/bash

i3status -c /home/ddavid/.config/i3status/config | while :
do
    read line
    meminfo=$(grep ^Dirty /proc/meminfo | tr -s " ")
    meminfo="[{\"name\":\"\",\"markup\":\"none\",\"full_text\":\"$meminfo\"},"
    if systemctl is-active vpn-tcp.service >/dev/null 2>&1 || systemctl is-active vpn-udp.service >/dev/null 2>&1; then
        vpn="VPN: active"
        color="#00ff00"
    else
        vpn="VPN: inactive"
        color="#ff0000"
    fi
    vpn="{\"name\":\"\",\"markup\":\"none\",\"color\":\"$color\",\"full_text\":\"$vpn\"},{"
    echo -e "${line/[{/${meminfo}$vpn}" || exit 1
done
