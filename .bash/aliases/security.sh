# rhash Commands
alias rh-create="sudo rhash -r --sha3-224 --bsd /etc -o /root/hash.lst"
alias rh-check="sudo rhash -r -c --bsd --skip-ok /root/hash.lst"
alias rh-update="sudo rhash -r -u /root/hash.lst"

# rkhunter
alias rk-update="sudo rkhunter --update"
alias rk-check="sudo rkhunter --check --enable all --disable none --rwo"
alias rk-systemchange="sudo rkhunter --propupd"
