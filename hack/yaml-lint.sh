if [ "$IS_CONTAINER" != "" ]; then 
  yamllint --config-data "{extends: default, rules: {line-length: {level: warning, max: 120}}}" /workdir/examples/ /workdir/installer/
else
  docker run -t -v $(pwd):/workdir --env IS_CONTAINER='TRUE' --entrypoint sh quay.io/coreos/yamllint /workdir/hack/yaml-lint.sh
fi;
