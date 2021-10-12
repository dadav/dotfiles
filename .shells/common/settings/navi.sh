command -v navi &>/dev/null && eval "$(navi widget "$(basename "$(ps -p $$ -o cmd=)")")"
