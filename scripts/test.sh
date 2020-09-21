#!/usr/bin/env bash

set -e pipefail

if ! [ -x "$(command -v python)" ]; then
  echo 'Unable to find Python command, please install Python (https://www.python.org/) and retry' >&2
  exit 1
fi

for f in $(ls ../templates/*.template)
do
  echo -e "#################"
  echo -e $f
  python -mjson.tool $f || break
done
