# WRF_Landfill Workflow

## Intel Enviroment  
```
export WRFIO_NCD_NO_LARGE_FILE_SUPPORT=1  
export NETCDF=/global/home/users/kwyang0331/NETCDF_compiled/  
export LD_LIBRARY_PATH=/global/home/users/kwyang0331/NETCDF_compiled/lib:$LD_LIBRARY_PATH  

#krishna says remove this line and i can still add jasper/zlib/libpng 
export JASPERLIB=/global/home/groups/consultsw/sl-7.x86_64/modules/jasper/2.0.14/lib64  
export JASPERINC=/global/home/groups/consultsw/sl-7.x86_64/modules/jasper/2.0.14/include  
export LIBPNGLIB=/global/home/groups/consultsw/sl-7.x86_64/modules/libpng/1.6.34/lib  
export LIBPNGINC=/global/home/groups/consultsw/sl-7.x86_64/modules/libpng/1.6.34/include  
export ZLIBINC=/global/home/groups/consultsw/sl-7.x86_64/modules/zlib/1.2.11/include  
export ZLIBLIB=/global/home/groups/consultsw/sl-7.x86_64/modules/zlib/1.2.11/lib  
export HDF5_USE_FILE_LOCKING='FALSE'  

#Path Setup for ANTHRO_EMIS  
#export NETCDF_DIR=/global/home/users/kwyang0331/NETCDF_compiled/include  
#module load  
module load intel-oneapi-compilers/2023.1.0  
module load intel-oneapi-mpi/2021.10.0  
module load anaconda3/2024.02-1-11.4  
module load netcdf-c/4.9.2  
module load netcdf-fortran/4.6.1  
module load hdf5/1.14.3  
module load vim  
module load cmake
```

## Path to compiled WPS and WRF 

```
/global/scratch/users/kwyang0331/Chemtracer/afterOSupdate/WRFchem/test/em_real
/global/scratch/users/kwyang0331/Chemtracer/afterOSupdate/WPS/

```

