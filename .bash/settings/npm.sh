#!/bin/bash

NPM_PACKAGES="${HOME}/.npm-packages"

[[ ! ":${NPM_PACKAGES}/bin:" =~ ":$PATH:" ]] && export PATH="${NPM_PACKAGES}/bin:$PATH" || true
[[ ! ":${NPM_PACKAGES}/share/man:" =~ ":$MANPATH:" ]] && export MANPATH="${NPM_PACKAGES}/share/man:$(manpath 2>/dev/null)" || true
