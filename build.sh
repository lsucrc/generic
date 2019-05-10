#!/bin/bash
cd /inputdir
source env_setting.txt
mkdir -p /workdir/${CONTAINER_VER}
mkdir -p /workdir/build

echo "START BUILDING"
if [ "$MPICH_VER" != "" ]
then   
   echo "INSTALLING MPI" 
   source /usr/local/bin/mpich.sh
fi

if [ "$H5_VER" != "" ]
then
   echo "INSTALLING HDF5"
   source /usr/local/bin/hdf5.sh
fi

if [ "$HYPRE_VER" != "" ]
then  
   echo "INSTALLING HYPRE"
   source /usr/local/bin/hypre.sh
fi

if [ "$NHWAVE_VER" != "" ]
then   
   echo "INSTALLING HYPRE"
   source /usr/local/bin/nhwave.sh
fi

if [ "$SWAN_VER" != "" ]
then
   echo "INSTALLING SWAN"
   source /usr/local/bin/swan.sh
fi

if [ "$OPENFOAM_VER" != "" ]
then
   echo "INSTALLING OPENFOAM"
   source /usr/local/bin/openfoam.sh
fi

if [ "$Funwave_tvd_VER" != "" ]
then
   echo "INSTALLING FUNWAVE-TVD"
   source /usr/local/bin/funwave-tvd.sh
fi


source /usr/local/bin/env.sh
   
