#!/usr/bin/env bash

BASEDIR=/vagrant/shell
. $BASEDIR/functions.sh

PARTS_DIR=$BASEDIR/privileged.d

prepare_parts "$PARTS_DIR"
$BASEDIR/run-parts -v --exit-on-error -- "$PARTS_DIR"
