
# Turn on bluetooth
function bton {
  sudo bluetooth on
  sudo systemctl start bluetooth
}

# Turn off bluetooth
function btoff {
  sudo systemctl stop bluetooth
  sudo bluetooth off
}
