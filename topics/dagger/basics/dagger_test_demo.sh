#!/usr/bin/env bash
# Run the sample app's unit tests inside a Dagger-managed container.
# The same command works on your laptop and in any CI runner that has
# the Dagger CLI and a container runtime (e.g. Docker).
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

for cmd in docker dagger; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Error: '$cmd' is required but not installed." >&2
    exit 1
  fi
done

echo "==> Running unit tests in a python:3.12-alpine container via Dagger"
dagger core container \
  from --address=python:3.12-alpine \
  with-directory --path=/app --directory=./app \
  with-workdir --path=/app \
  with-exec --args=python,-m,unittest,-v \
  stdout

echo "==> Tests passed. Edit app/calc.py to break a test and run again to see the pipeline fail."
