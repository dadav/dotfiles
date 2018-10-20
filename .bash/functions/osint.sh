function getsubdomains() {
  curl -s "https://virustotal.com/ui/domains/$1/subdomains\?limit\=10" | jq ".data[].id"
}

function pnmap() {
  xsltproc <(curl -s https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/nmap-bootstrap.xsl) <(sudo nmap -oX - $@) |& firefox "data:text/html;base64,$(base64 -w 0 <&0)" 2>/dev/null
}
