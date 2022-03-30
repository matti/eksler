_output() {
  1>&2 echo " --[ $0 ]--[ $SECONDS ]-- $@"
}

_err() {
  _output "err:  $@"
  exit 1
}

_forever() {
  while true; do
    _output "_forever: $@"
    eval "$@" && break
    sleep 1
  done
}

_never() {
  while true; do
    _output "_never: $@"
    eval "$@" || break
    sleep 1
  done
}

_forever_any() {
  while true; do
    value=$(eval $@)
    [ "$?" = "0" ] && [ "$value" != "" ] && break
    sleep 1
  done

  echo "$value"
}

_done() {
  echo ""
  _output "DONE"
}

_shutdown() {
  echo ""
  echo "SHUTDOWN ($0)"

  trap '' TERM INT ERR

  kill 0

  wait

  echo "bye. $0"
}

trap _shutdown TERM INT ERR
