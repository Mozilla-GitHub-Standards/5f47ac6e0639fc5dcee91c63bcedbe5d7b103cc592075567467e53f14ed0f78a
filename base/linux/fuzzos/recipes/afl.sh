#!/usr/bin/env bash

set -e
set -x

#### AFL

TMPD="$(mktemp -d -p. afl.build.XXXXXXXXXX)"
( cd "$TMPD"
  git clone -v --depth 1 --no-tags https://github.com/choller/afl.git
  ( cd afl
    make
    make -C llvm_mode
    make install
  )
)
rm -rf "$TMPD"
