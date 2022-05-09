#!/usr/bin/env bash

_echoerr() {
  1>&2 echo "$@"
}

_output() {
  _echoerr " --[ $0 ]--[ $SECONDS ]-- $*"
}

_err() {
  _output "err: $*"
  exit 1
}

_forever() {
  while true; do
    _output "_forever: $*"
    eval "$*" && break
    sleep 1
  done
}

_never() {
  while true; do
    _output "_never: $*"
    eval "$*" || break
    sleep 1
  done
}

_forever_any() {
  while true; do
    value=$(eval "$*" || true)
    [ "$?" = "0" ] && [ "$value" != "" ] && break
    sleep 1
  done

  echo "$value"
}

_done() {
  echo ""
  _output "$* DONE in ${SECONDS}s"
}