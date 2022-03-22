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
  echo "SHUTDOWN"

  while true; do
    pids=$(jobs -p)
    [ "$pids" = "" ] && break

    echo "SHUTDOWN $0 - pids: $pids"

    for pid in $pids; do
      (
        while true; do
          echo "sending kill to $pid"
          kill $pid || break
          sleep 1
        done

        echo "failed to kill $pid"
      ) &
    done

    wait $(jobs -p)
  done

  echo ""
  echo "bye (from $0)."
  exit 0
}

trap _shutdown TERM INT