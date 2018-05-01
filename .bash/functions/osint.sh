function getsubdomains() {
  curl -s "https://virustotal.com/ui/domains/$1/subdomains\?limit\=10" | jq ".data[].id"
}
