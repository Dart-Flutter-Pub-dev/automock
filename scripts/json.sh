#!/usr/bin/env bash

set -e

DIR=`dirname $0`

flutter pub run build_runner build --delete-conflicting-outputs

$DIR/format.sh