# Print the path
alias pp="tr ':' '\n' <<< $PATH | nl"

# Reset the terminal
alias fix_terminal='reset; stty sane; tput rs1; clear; echo -e "\033c"'

# no nohup.out
alias nohup='>/dev/null 2>&1 nohup'

# use bat
alias cat='bat -pp'

# best compression
alias tarc='tar -cI"zstd -19 -T0" -f'

# be more verbose
alias dirs="dirs -v"
