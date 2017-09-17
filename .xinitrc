nm-applet --sm-disable &
pgrep redshift &> /dev/null || redshift &> /dev/null
exec i3
