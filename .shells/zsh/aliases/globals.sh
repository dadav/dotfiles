alias -g -- --rainbow='|lolcat'
alias -g -- --colorize='|ccze -A'
alias -g L='|less'
alias -g V='|nvim -'
alias -g G='|grep -i'
alias -g GV='|grep -iva'

# newest directory
alias -g ND='*(/om[1])'
# newest file
alias -g NF='*(.om[1])'
# 10 biggest files
alias -g BF10='*(.OL[1,10])'
# 10 last modified files
alias -g OF10='*(.Om[1,10])'

# recursive versions of previous aliases
alias -g NDR='**/*(/om[1])'
alias -g NFR='**/*(.om[1])'
alias -g BF10R='**/*(.OL[1,10])'
alias -g OF10R='**/*(.Om[1,10])'

# others
alias -g Q='>/dev/null 2>&1'
