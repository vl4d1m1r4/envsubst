#!/usr/bin/env bash

PROCESSED_DIR=$(pwd)/processed
WORKDIR=$(pwd)/workdir
FIXTURES_DIR=$(pwd)/fixtures

VAR_1=A
VAR_2=B

docker build -t test-envsubst .

docker run --rm -v $WORKDIR:/workdir -v $PROCESSED_DIR:/processed -e "VAR_1=${VAR_1}" -e "VAR_2=${VAR_2}" test-envsubst


test "$(cat ${FIXTURES_DIR}/test.yaml)" = "$(cat ${PROCESSED_DIR}/test.yaml)"