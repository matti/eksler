_output() {
  1>&2 echo " --[ $0 ]-- $@"
}

_err() {
  _output "err:  $@"
  exit 1
}

_forever() {
  while true; do
    _output "_forever: $@"
    $@ && break
    sleep 1
  done
}

_never() {
  while true; do
    _output "_never: $@"
    $@ || break
    sleep 1
  done
}

_done() {
  echo ""
  _output "DONE"
}