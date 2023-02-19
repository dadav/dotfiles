
alias journalctl='SYSTEMD_PAGERSECURE=1 SYSTEMD_COLORS=0 SYSTEMD_PAGER="$(which bat) --language syslog --plain" journalctl'
