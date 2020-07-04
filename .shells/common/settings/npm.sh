#!/bin/bash

NPM_PACKAGES="${HOME}/.npm-packages"

if [[ ! ":$PATH:" =~ :${NPM_PACKAGES}/bin: ]]; then
  export PATH="${NPM_PACKAGES}/bin:$PATH"
fi
if [[ ! ":$PATH:" =~ :${NPM_PACKAGES}/share/man: ]]; then
  export MANPATH="${NPM_PACKAGES}/share/man:$(manpath 2>/dev/null)"
fi
