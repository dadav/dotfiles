#!/bin/bash

# Bluetooth controller

function bton {
  sudo bluetooth on
  sudo systemctl start bluetooth
}

function btoff {
  sudo systemctl stop bluetooth
  sudo bluetooth off
}

function btdvid {
  echo -e 'devices\n' | bluetoothctl | awk '$3 ~ /'"$1"'/ { print $2 }' | head -1
}

function btsc {
  scid=$(btdvid SoundCore)
  echo -e "power on\n" | bluetoothctl
  echo -e "connect $scid\n" | bluetoothctl
}
