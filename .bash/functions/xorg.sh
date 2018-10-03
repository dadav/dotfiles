#!/bin/bash

function tgltp(){
  NAME=$(xinput --list --name-only | grep TouchPad)
  if grep disabled <(sed -n '2p' <(xinput list "$NAME")) &>/dev/null; then
    xinput enable "$NAME"
  else
    xinput disable "$NAME"
  fi
}
