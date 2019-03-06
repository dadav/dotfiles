function trackurl(){
  curl -sD - -o /dev/null -L "$1" | grep Location
}
