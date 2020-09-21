#!/usr/bin/env sh

set -e pipefail

preflight() {
  if ! [ -x "$(command -v python)" ]; then
    echo 'Unable to find Python command, please install Python (https://www.python.org/) and retry' >&2
    exit 1
  fi
}

check() {
  for f in $(ls ../templates/*.template)
  do
    echo -e "#################"
    echo -e $f
    python -mjson.tool $f || break
  done
}

main() {
  preflight
  check
}

main
