#!/bin/bash
SEABIOS_VERSION=1.10.0
SEABIOS_URL=git://git.seabios.org/seabios.git
SEABIOS_FILE=seabios-$SEABIOS_VERSION.tar.gz
SEABIOS_REF=rel-$SEABIOS_VERSION

echo "Checking Seabios $SEABIOS_VERSION release tarball"
if [[ ! -e SOURCES/$SEABIOS_FILE ]] ; then
    mkdir -p git-tmp
    pushd git-tmp
    
    echo " Cloning seabios repo..."
    git clone $SEABIOS_URL seabios.git || exit 1
    cd seabios.git
    echo " Creating $SEABIOS_FILE..."
    git archive --prefix=seabios-$SEABIOS_VERSION/ -o ../../SOURCES/$SEABIOS_FILE $SEABIOS_REF || exit 1
    popd
fi

if [[ -e git-tmp ]] ; then
    echo "Cleaning up cloned repositores"
    rm -rf git-tmp
fi

echo "All sources present."
