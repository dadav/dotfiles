function showmap() {
telnet mapscii.me
}

function cmdfu() {
curl "https://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext";
}

function getlast() {
	fc -ln "-${1:-10}" | sed 's/[[:space:]]*//'
}

function btrace() {
	strace $* |& vim -c ":set syntax=strace" -
}

function lsofx() {
sudo lsof -n -F | lsofgraph | unflatten -l1 -c6 | dot -Tpng | feh -
}
