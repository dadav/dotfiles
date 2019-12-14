export SONARPATH="/opt/sonar-scanner/bin"
[[ ! ":$PATH:" =~ :${SONARPATH}: ]] && export PATH="${SONARPATH}/bin:$PATH" || true
