#!/bin/sh
if [ "$IS_CONTAINER" != "" ]; then
  echo "Processing directory $1"
  go vet "$1"
else
  for dir in "$@"
  do
    docker run --rm --env IS_CONTAINER='TRUE' -v "$PWD":/go/src/github.com/openshift/installer -w /go/src/github.com/openshift/installer quay.io/coreos/golang-testing ./hack/go-vet.sh "$dir"
  done;
fi;
