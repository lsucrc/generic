#!/bin/bash

source /usr/local/bin/env.sh

if [ "$Funwave_tvd_VER" != "" ]
then
    echo "BUILDING FUNWAVE-TVD: Version $Funwave_tvd_VER"

    export BASE_DIR="/workdir/$CONTAINER_VER/funwave-tvd$Funwave_tvd_VER"
    mkdir -p $BASE_DIR
    cd $BASE_DIR
    if [ ! -r Version_$Funwave_tvd_VER.tar.gz ] 
    then
        git clone https://github.com/fengyanshi/FUNWAVE-TVD/archive/Version_$Funwave_tvd_VER.tar.gz
    fi
    rm -fr FUNWAVE-TVD-Version_$Funwave_tvd_VER 
    tar xzf Version_$Funwave_tvd_VER.tar.gz
    cd FUNWAVE-TVD-Version_$Funwave_tvd_VER/src 
    perl -p -i -e 's/FLAG_8 = -DCOUPLING/#$&/' Makefile
    
    echo "BUILDING HERE:"
    pwd
    make clean && make 
fi
