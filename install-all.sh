#!/bin/bash

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(cd "$(dirname "$0")"; pwd)
readonly ARGS="$@"
readonly PREFIX="fabric-"

main() {
    local modules="core facts"

    for m in $modules
    do
        echo "installing module $PREFIX$m..."
        echo "----------------------------------------"
        cd $PROGDIR/$PREFIX$m/babel
        lein do clean, install
    done

    cd $PROGDIR/babel
    lein do clean, install
}

main
