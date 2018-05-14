# Share text
alias tb="(exec 3<>/dev/tcp/termbin.com/9999; cat >&3; cat <&3; exec 3<&-)"

# Print the path
alias pp="tr ':' '\n' <<< $PATH | nl"

# Reset the terminal
alias fix='reset; stty sane; tput rs1; clear; echo -e "\033c"'
