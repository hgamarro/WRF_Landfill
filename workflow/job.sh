#!/bin/bash
#SBATCH --job-name=ParkerJob
#SBATCH --partition=savio3
#SBATCH --qos=aiolos_savio3_normal
#SBATCH --account=co_aiolos
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=40
#SBATCH --time=23:59:59
#SBATCH --mail-type=all
#SBATCH --mail-user=kwyang0331@berkeley.edu

#SET-UPS
RUN_WPS=0
RUN_REAL=1 
RUN_EMISS=0 
RUN_WRF=0

#DIRECTORIES
Here=$PWD
WPSDIR=$PWD/WPS
WRFDIR=$PWD/WRF

#DIRECTORIES FOR EXECUTABLES
WRFCHEMRUNDIR=/global/scratch/users/kwyang0331/Chemtracer/afterOSupdate/WRFchem/test/em_real
WPSRUNDIR=/global/scratch/users/kwyang0331/Chemtracer/afterOSupdate/WPS

#WPS RUNS
if [ $RUN_WPS = 1 ]; then
  echo
  echo "Starting WPS RUN..."
  cd $WPSDIR
  if [ $? -ne 0 ]; then
	  echo "ERROR: FAILED TO CHANGE DIRECTORY TO HERE."
	  exit 1
  fi
  cp namelist.wps /global/scratch/users/kwyang0331/Chemtracer/afterOSupdate/WPS/

  if [ $? -ne 0 ]; then
    echo "An error occurred: namelist.wps not found g."
    exit 1
  fi
  
  cd $WPSRUNDIR 

  ./geogrid.exe
  ./metgrid.exe
  
  ln -sf geo_em.d* $WPSDIR
  if [ $? -ne 0 ]; then

	  echo "Error: no geo_em files created"
	  exit
  fi
  
  ln -sf met_em.d* $WPSDIR
  if [ $? -ne 0 ]; then
	  echo "Error: no Met files created"
	  exit
  fi
fi

#REAL RUNS
if [ $RUN_REAL = 1 ]; then
  
  cd $WPSDIR
  ln -sf met_em.d0* $WRFCHEMRUNDIR
  if [ $? -ne 0 ]; then
	echo "An error occured for met_em* moving to WRF CHEM DIR"
	exit 1
  fi	
  
  cd $WRFDIR
  cp namelist.input $WRFCHEMRUNDIR
  if [ $? -ne 0 ]; then
    echo "An error occurred: namelist.input not found g."
    exit 1
  fi
  
  cd $WRFCHEMDIR
  mpirun ./real.exe
fi

#EMISS RUNS
if [ $RUN_EMISS = 1 ]; then
  cd $HERE
  echo 
  echo "Make sure you now edit your emission ..."
fi



#WRF RUNS

if [ $RUN_WRF = 1 ]; then
  cd $HERE

fi


