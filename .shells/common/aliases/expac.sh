# show installed packge sizes
alias expacl='expac -H M "%m\t%n" | sort -h'
# show last installed packages
alias expaci='expac --timefmt="%Y-%m-%d %T" "%l\t%n" | sort | tail -n 20'
# show dependencies for package
alias expacd='expac -l "\n" %E -S'
