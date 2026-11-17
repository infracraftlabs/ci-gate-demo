#!/usr/bin/env bash
# A stand-in test suite. It fails when the file FAIL exists, so a pull request can fail on purpose.
set -euo pipefail
if [ -f FAIL ]; then
  echo "test failed: FAIL marker present" >&2
  exit 1
fi
echo "all tests passed"
