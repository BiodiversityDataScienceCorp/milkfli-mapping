![](https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/Photos/butterfly-gcb28d2610_1280.jpg)

## Overview
The Showy Milkweed (*Asclepias speciosa*) is one of various host plants to monarch butterflies (*Danaus plexippus*: Nymphalidae). Monarch populations have been observed to be declining at an average rate, with respect to other butterfly species, in the United States. However, the number of migratory individuals that return from overwintering sites has also been declining -- likely as a result of climate change. Plants, of course, are also affected by this change. Therefore, understanding the occurrences and distribution of monarch host plants may be key in their long-term conservation efforts. 

This repository serves to examine occurrences and the current and future distributions of the Showy Milkweed populations in North America. Data from the Global Biodiversity Information Facility (GBIF), an open-access source of biodiversity data from several sources (including, but not limited to, iNaturalist, USGS, and museum collections), was utilized in this project. 

A [Species Status Assessment](https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/SSA.md) of the Showy Milkweed was created and resides in the Outputs folder of this repository. This document contains information on the species, data cleaning process, and generated occurrence and distribution maps. At the end of the day, this repository is a documentation of the methods and analysis used towards Showy Milkweed data.

Many thanks to Jeff Oliver for the code used in species distribution modelling! This borrowed code can be found at [https://github.com/jcoliver/biodiversity-sdm-lesson](https://github.com/jcoliver/biodiversity-sdm-lesson).

## Dependencies
The following additional R packages are required (these will be installed when running the main script, `SRC/main.R`):

+ dismo
+ maps
+ maptools
+ raster
+ rgdal
+ sf
+ sp
+ spocc
+ tidyverse

## Structure
+ **SSA.md:** Species Status Assessment for Showy Milkweed (*Asclepias speciosa*)
+ **Data:** Contains the data used for occurrence and distribution maps
  + cmip5: Forecast climate data at 2.5 minute resolution from [WorldClim](http://www.worldclim.org). These data were originally downloaded from the WorldClim website, but stored in the `.RData` format for ease of use. The data are for the year 2070, based on the GFDL-ESM2G model with an RCP of 4.5 CO<sub>2</sub>. For an examination of different forecast models, see [McSweeney et al. 2015](https://link.springer.com/article/10.1007/s00382-014-2418-8).
  + showy_milkweed.csv: Data harvested from [GBIF](https://www.gbif.org/) for Showy Milkweed (*A. speciosa*). This dataset is not under version control, but will be harvested by running SRC/main.R.
  + showy_milkweed_noNA.csv: Filtered version of showy_milkweed.csv. Omits individual counts with a value of NA.
  + showy_milkweed_noNA_coord.csv: Filtered version of showy_milkweed.csv. Omits latitudes and longitudes with a value of NA.
  + wc2-5: Climate data at 2.5 minute resolution from [WorldClim](http://www.worldclim.org) (_note_: this folder is not under version control, but will be created by running the setup script (`scripts/setup.R`))
+ **SRC:** Contains R scripts for gathering occurrence data, running forecast models, and creating map outputs.
  + main.R: describe what main.R does!
  + sdm-functions.R:
  + setup-for-current-and-future-sdm.R:
  + A-speciosa-sdm-current-single.R:
  + A-speciosa-sdm-future-single.R:
+ **Outputs** (contents are not under version control): Contains generated maps
  + showy_milkweed_occurrence_map.jpg: Occurrence map of *A. speciosa*
  +
  +
+ **Photos:** Contains images used in repository and documents
  + 
+ **README.md:** You're looking at it!

## How do I run the code?
The code used in this project is in R script. Therefore, there are two options:

### RStudio Cloud
Will need to run each part individually

### RStudio Desktop
Can probably run the main.R as a whole
