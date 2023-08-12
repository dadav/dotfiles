

function getcerts() {
  openssl s_client -connect "$1":"${2:-443}" -showcerts < /dev/null 2>/dev/null \
    | sed -n '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/p'
}
