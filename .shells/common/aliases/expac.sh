alias lpac='expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <({ pacman -Qqg base-devel; expac -l "\n" "%E" base; } | sort | uniq)) | sort -n'
alias lipac='expac --timefmt="%Y-%m-%d %T" "%l\t%n" | sort | tail -n 20'
