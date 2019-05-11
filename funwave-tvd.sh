#!/bin/bash

source /usr/local/bin/env.sh

if [ "$FUNWAVE_TVD_VER" != "" ]
then
    echo "BUILDING FUNWAVE-TVD: Version $FUNWAVE_TVD_VER"
    export BASE_DIR="/workdir/${CONTAINER_VER}/dep-mpich$MPICH_VER"
    export F_TVD_DIR="/workdir/${CONTAINER_VER}/dep-mpich$MPICH_VER/funwave-tvd$FUNWAVE_TVD_VER"
    mkdir -p $BASE_DIR 
    cd $BASE_DIR
    if [ ! -r Version_$FUNWAVE_TVD_VER.tar.gz ] 
    then
        curl -kLO https://github.com/fengyanshi/FUNWAVE-TVD/archive/Version_$FUNWAVE_TVD_VER.tar.gz
    fi
    rm -fr FUNWAVE-TVD-Version_$FUNWAVE_TVD_VER
    tar xzf Version_$FUNWAVE_TVD_VER.tar.gz
    cd FUNWAVE-TVD-Version_$FUNWAVE_TVD_VER/src 
    perl -p -i -e 's/FLAG_8 = -DCOUPLING/#$&/' Makefile
    
    echo "BUILDING HERE:"
    pwd
    make clean && make 
fi
