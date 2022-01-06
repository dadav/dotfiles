if [[ ! ":$PATH:" =~ :/opt/android-sdk/Sdk/tools/: ]]; then
  export PATH="$PATH:/opt/android-sdk/Sdk/tools/"
fi
if [[ ! ":$PATH:" =~ :/opt/android-sdk/Sdk/cmdline-tools/latest/bin/: ]]; then
  export PATH="$PATH:/opt/android-sdk/Sdk/cmdline-tools/latest/bin/"
fi
