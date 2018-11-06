#!/bin/bash

GEM_PATH="${HOME}/.gem/ruby/2.5.0/bin"

[[ ! ":$PATH:" =~ ":${GEM_PATH}:" ]] && export PATH="${GEM_PATH}:$PATH" || true
