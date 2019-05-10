#!/bin/bash

source /usr/local/bin/env.sh

if [ "$SWAN_VER" != "" ]
then
    echo "BUILDING SWAN: Version $SWAN_VER"
    # download swan source code and extract it 
    export BASE_DIR="/workdir/$CONTAINER_VER/dep-mpich$MPICH_VER"
    export SWAN_DIR="/workdir/$CONTAINER_VER/dep-mpich$MPICH_VER/swan${SWAN_VER}"
    mkdir -p $BASE_DIR
    cd $BASE_DIR
    if [ ! -r swan${SWAN_VER}.tar.gz ]
    then
        curl -kLO http://swanmodel.sourceforge.net/download/zip/swan${SWAN_VER}.tar.gz
    fi
    rm -fr swan${SWAN_VER}
    tar xzf swan${SWAN_VER}.tar.gz

    # compile swan 
    cd swan${SWAN_VER}
    echo "BUILDING HERE:"
    pwd
    make config && make mpi

    chmod 755 $SWAN_DIR/swanrun 
fi
