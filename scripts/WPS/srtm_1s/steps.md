# Use high resolution SRTM 1s (30m) elevation data 




link for earthdata 

how did we find the landfill and download the data? 

once downloaded we used qgis ....
•Download the .tif file from the website linked above(https://earthexplorer.usgs.gov) 
Go to datasets -> digital elevation -> SRTM -> SRTM 1 Arc-Second Global
•In QGIS, Layer -> Add Layer -> Add Raster Layer; select the .tif file> 
Merging->make layer style for every tiff file-> Raster->miscellaneous->merge-> set the parameter -> make output datatype int16-> advanced parameter ->input pixel value = -32767 and assigned value = -32767 -> hit run
•Using the GIS4WRF plugin, GIS4WRF -> Datasets -> Process -> Convert active layer to WPS binary -> Is this layer’s data categorical? (NO) -> Save data
•Copy binaries and index files to a new directory, for instance, “topo_srtm_3s”
•Move “topo_srtm_3s” to the directory that stores WRF static datasets, which is usually WPS_GEOG
•Create the new terrain class “topo_srtn_1_3s” in GEOGRID.TBL
•Select as an option in the WRF namelist.wps geog_data_res = ‘topo_srtm_1_3s’




useful links   
https://gis4wrf.github.io/  
https://ral.ucar.edu/sites/default/files/public/Lesson-wps.html


