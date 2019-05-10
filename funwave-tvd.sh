#!/bin/bash

source /usr/local/bin/env.sh

if [ "$Funwave-tvd_VER" != "" ]
then
    echo "BUILDING FUNWAVE-TVD: Version $Funwave-tvd"

    export BASE_DIR="/workdir/$CONTAINER_VER/funwave-tvd$Funwave-tvd_VER"
    mkdir -p $BASE_DIR
    cd $BASE_DIR
    git clone https://github.com/fengyanshi/FUNWAVE-TVD
    cd FUNWAVE-TVD/src 
    perl -p -i -e 's/FLAG_8 = -DCOUPLING/#$&/' Makefile
    
    echo "BUILDING HERE:"
    pwd
    make clean && make 
fi
