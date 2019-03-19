## DOWNLOAD PUBLIC DATA ##
# Aug 2016: Functional and publicly available #
# Jan 2017: Removed references to elevation data which had become restricted #
# Mar 2017: NOAA changed URL of hosted files #

setwd('/Users/mtice/Documents/data/predicting-poverty-master')
rm(list=ls())
library(R.utils)


for (year in 2010:2013){
  url <- paste0('https://ngdc.noaa.gov/eog/dmsp/downloadV4composites.html', year, '.v4.tar')
  temp <- paste0('Nightlights', year)
  dir.create(temp)
  dest <- paste0(temp, '/F18', year, '.v4.tar')
  download.file(url, dest)
  untar(dest, exdir = temp)
  file <- list.files(temp)
  file <- file[substr(file, nchar(file)-27, nchar(file))=='stable_lights.avg_vis.tif.gz
  tif <- paste0(temp, '/', file)
  file <- substr(file, 1, nchar(file)-3)
  gunzip(tif, paste0(temp, '/', file))
  unlink(paste0(temp, '/', list.files(temp)[list.files(temp)!=file]), recursive = T)
  print(year)
  rm(dest, file, temp, tif, url, year)
}
unload(R.utils)
