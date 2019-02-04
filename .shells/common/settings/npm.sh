#!/bin/bash

NPM_PACKAGES="${HOME}/.npm-packages"

[[ ! ":$PATH:" =~ :${NPM_PACKAGES}/bin: ]] && export PATH="${NPM_PACKAGES}/bin:$PATH" || true
[[ ! ":$PATH:" =~ :${NPM_PACKAGES}/share/man: ]] && export MANPATH="${NPM_PACKAGES}/share/man:$(manpath 2>/dev/null)" || true
