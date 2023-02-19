
# show installed packge sizes
alias packages_by_size='expac -H M "%m\t%n" | sort -h'

# show last installed packages
alias packages_by_date='expac --timefmt="%Y-%m-%d %T" "%l\t%n" | sort | tail -n 20'

# show dependencies for package
alias packages_dependencies='expac -l "\n" %E -S'
