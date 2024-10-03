alias -g -- --rainbow='|lolcat'

# newest directory
alias -g ND='*(/om[1])'

# newest file
alias -g NF='*(.om[1])'

# remove aur packages from paru
alias -g -- --no-aur="| sed '/^aur/{N;d;}'"
