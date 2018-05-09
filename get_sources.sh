#!/bin/bash
SEABIOS_VERSION=`grep ^Version: SPECS/seabios.spec | cut -d: -f2 | tr -d '[:space:]'` 
SEABIOS_URL=https://review.coreboot.org/cgit/seabios.git/snapshot/
SEABIOS_FILE=seabios-rel-$SEABIOS_VERSION.tar.gz

echo "Checking Seabios $SEABIOS_VERSION release tarball"
if [[ ! -e SOURCES/$SEABIOS_FILE ]] ; then
    mkdir -p SOURCES/
    cd SOURCES/
    wget $SEABIOS_URL/$SEABIOS_FILE
fi

echo "All sources present."
