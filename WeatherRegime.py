# -*- coding: utf-8 -*-
"""
Created on Thu Oct 11 14:01:51 2018

@author: wzhang89
"""
#matplotlib inline
#import sys
#sys.modules[__name__].__dict__.clear()

import numpy as np
import matplotlib.pyplot as plt
import xarray as xr
import cartopy.crs as ccrs
from sklearn.cluster import KMeans
from netCDF4 import Dataset


def get_cluster_fraction(m, label):        
    return (m.labels_==label).sum()/(m.labels_.size*1.0)
    
z5001 = xr.open_dataset('Z://CMIP5_daily_zg//HistALL//IPSL-CM5A-LR//zg_day_IPSL-CM5A-LR_historical_r2i1p1_zg500.nc', decode_times=False) #500-hPa geopotential height anomaly
z500 = z5001.squeeze()
da = z500.zg.load()

data = da.values
nt,ny,nx = data.shape
data = np.reshape(data, [nt, ny*nx], order='F')
mk = KMeans(n_clusters=5, random_state=0, n_jobs=-1).fit(data)
x,y = np.meshgrid(da.lon, da.lat)

#proj = ccrs.Orthographic(0,45)
#proj = ccrs.PlateCarree()
proj = ccrs.LambertConformal(central_longitude=-96.0, central_latitude=39.0, false_easting=0.0, false_northing=0.0, secant_latitudes=None, standard_parallels=None, globe=None, cutoff=-30)
# (central_longitude=-96.0, central_latitude=39.0, false_easting=0.0, false_northing=0.0, secant_latitudes=None, standard_parallels=None, globe=None, cutoff=-30)[source]
fig, axes = plt.subplots(3,2,figsize=(10,6),subplot_kw=dict(projection=proj))

regimes = ['WT1', 'WT2', 'WT3', 'WT4','WT5']

tags = list('abcde')
for i in range(mk.n_clusters):
    onecen = mk.cluster_centers_[i,:].reshape(ny,nx, order='F')
    print(onecen)
    cs = axes.flat[i].contourf(x, y, onecen,
                               levels=np.arange(-90, 100, 10),  
                               transform=ccrs.PlateCarree(),
                               cmap='RdBu_r')
# levels=np.arange(-150, 151, 30)    
    #axes.flat[i].set_xlim(240, 320)
    cb=fig.colorbar(cs, ax=axes.flat[i], shrink=0.8, aspect=20) 
    #cb.set_label('[unit: m]',labelpad=-7)    
    axes.flat[i].coastlines()
    axes.flat[i].set_global()
    axes.flat[i].set_extent((220-360,300-360,10,50))
  
    title = '{}, {:4.1f}%'.format(regimes[i], get_cluster_fraction(mk, i)*100)
    axes.flat[i].set_title(title)
    plt.text(0, 1, tags[i], 
             transform=axes.flat[i].transAxes, 
             va='bottom', 
             fontsize=plt.rcParams['font.size']*0.1, 
             fontweight='bold')

plt.savefig('Weatherregimes.pdf', dpi=None, facecolor='w', edgecolor='w',
        orientation='portrait', papertype=None, format=None,
        transparent=False, bbox_inches=None, pad_inches=0.1,
        frameon=None, metadata=None)

import numpy as np
col1_array = np.arange(0,nt,1) 
print(np.shape(mk.labels_))
data = np.array([col1_array, mk.labels_])
data = data.T
np.savetxt('C5-daily-new.csv', data,delimiter=',')

onecen = mk.cluster_centers_[:,:].reshape(5,ny,nx, order='F')
fout1 = "Kmean-5C-center.nc" 
rootgrp1 = Dataset(fout1, 'w', format='NETCDF3_CLASSIC')     # print rootgrp.file_format

lons = da.lon
lats = da.lat
        # create the netcdf dimensions     
time1 = rootgrp1.createDimension('time', None) # None means the time dimension is unlimited
lat1 = rootgrp1.createDimension('lat', lats.shape[0])  
lon1 = rootgrp1.createDimension('lon', lons.shape[0])

        #create the netcdf Variables 
longitudes1 = rootgrp1.createVariable('lon','f4',('lon',))
latitudes1 = rootgrp1.createVariable('lat','f4',('lat',))
times1 = rootgrp1.createVariable('time','f4',('time',))       
times1 = [0,1,2,3,4]

temp_qu = rootgrp1.createVariable('gph','f4',('time','lat','lon',))
temp_qu[:, :, :] = onecen[:, :, :]


longitudes1[:] = lons[:]
latitudes1[:] = lats[:]
rootgrp1.close()  
 
