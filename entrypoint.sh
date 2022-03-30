#!/usr/bin/env bash
set -euo pipefail
_shutdown() {
  echo "BYE"
  kill 0
  wait 0
}

trap _shutdown TERM INT ERR
echo "HANG"

tail -f /dev/null & wait $!