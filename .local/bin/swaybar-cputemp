#!/bin/bash
h=$(hostnamectl hostname)
[[ "$h" = 'darch' ]] && sensors -j acpitz-acpi-0 | jq '.["acpitz-acpi-0"]["temp1"]["temp1_input"]'
[[ "$h" = 'lapt430' ]] && sensors -j thinkpad-isa-0000 2>/dev/null | jq '.["thinkpad-isa-0000"]["CPU"]["temp1_input"]'
true
