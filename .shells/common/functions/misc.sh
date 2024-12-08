function last_commands() {
	fc -ln "-${1:-10}" | sed 's/[[:space:]]*//'
}

function cdd() {
	cd "$@" && ls -ltr
}

function mkcd() {
	mkdir -p "$1"
	cd "$1"
}
