#!/bin/bash

GEM_PATH="${HOME}/.gem/ruby/2.5.0/bin"

[[ ! ":${GEM_PATH}:" =~ ":$PATH:" ]] && export PATH="${GEM_PATH}:$PATH" || true
