# export QTWEBENGINE_DISABLE_SANDBOX=1
export QT_IM_MODULE=ibus
# If not in Tmux and not on laptop
#( [[ -z "$TMUX" ]] && [[ "$(< /sys/devices/virtual/dmi/id/chassis_vendor)" != "LENOVO" ]] && setleds -D +num || exit 0)
