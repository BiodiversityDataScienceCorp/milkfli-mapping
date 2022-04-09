<<<<<<< HEAD
<<<<<<< HEAD
# Species Status Assessment (SSA) 

### Species Name: Showy Milkweed - *Asclepias Speciosa*


### Species Taxonomy:
### Kingdom: *Plantae* (Plants) 
### Division: *Anthophyta* (Flowering plants)
### Class: *Dicotyledoneae* (Dicots )
### Order:  *Gentianales* (Dogbane / Gentian)
### Family: *Asclepiadaceae* (Milkweeds)
### Species: *Asclepias speciosa* (Showy Milkweed) 
![alt text](https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/Outputs/monarch_on_showy.jpeg?raw=true)
https://www.fws.gov/media/monarch-butterfly-showy-milkweed


### Species Description 
“A stout, sparingly branched, pubescent perennial, 1 1/2-3 ft. tall, with large, oval, blue-green leaves and showy, spherical clusters of rose-colored flowers. Flowers occur at the top of the stem and on stalks from leaf axils. A grayish, velvety plant with erect leafy stems and with umbels of star-like pinkish flowers in upper axils and at top. Sap milky.” (wildflower.org)

### Habitat Description
“Found in habitats ranging from sunny and dry to moist in savannas, prairies, road-sides, old fields, and meadows.” (wildflower.org) 

### Larval Host Information
Monarch butterflies, Queen butterflies, Dogbane Tiger Moths, and Red belted clearwing moth larvae feed on Showy Milkweed. 

### Data Source(s) for Occurence and Distribution Modeling
GBIF

### Species Occurrence Map
![alt text](https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/Outputs/showy_milkweed_occurrence_map.jpg?raw=true)

### Link to GitHub Repository

https://github.com/BiodiversityDataScienceCorp/milkfli-mapping

### References


=======
>>>>>>> 1fcc0f4713283e4ce12da047f9995b04936c9093
=======
![](https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/Photos/butterfly-gcb28d2610_1280.jpg)

## Overview
The Showy Milkweed (*Asclepias speciosa*) is one of various host plants to monarch butterflies (*Danaus plexippus*: Nymphalidae).

This repository serves to examine occurrences and the current and future distributions of the Showy Milkweed populations in North America. Data from the Global Biodiversity Information Facility (GBIF), an open-access source of biodiversity data from several sources (including, but not limited to, iNaturalist, USGS, and museum collections), was utilized in this project. 

A [Species Status Assessment](https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/SSA.md) of the Showy Milkweed was created and resides in the Outputs folder of this repository. This document contains information on the species, data cleaning process, and generated occurrence and distribution maps.

Many thanks to Jeff Oliver for the code used in species distribution modelling! This borrowed code can be found at [https://github.com/jcoliver/biodiversity-sdm-lesson](https://github.com/jcoliver/biodiversity-sdm-lesson).

## Dependencies
The following additional R packages are required (these will be installed by running the the setup script, `src/setup.R`):

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
+ SSA.md: Species Status Assessment for Showy Milkweed (*Asclepias speciosa*)
+ Data
  + wc2-5: climate data at 2.5 minute resolution from [WorldClim](http://www.worldclim.org) (_note_: this folder is not under version control, but will be created by running the setup script (`scripts/setup.R`))
  + cmip5: forcast climate data at 2.5 minute resolution from [WorldClim](http://www.worldclim.org). These data were originally downloaded from the WorldClim website, but stored in the `.RData` format for ease of use. The data are for the year 2070, based on the GFDL-ESM2G model with an RCP of 4.5 CO<sub>2</sub>. For an examination of different forecast models, see [McSweeney et al. 2015](https://link.springer.com/article/10.1007/s00382-014-2418-8).
  + speciesDataSet.csv: data harvested from [GBIF](https://www.gbif.org/) for _Species name_. This dataset is not under version control, but will be harvested by running src/main.R.
+ Outputs (contents are not under version control): 
+ SRC: directory containing R scripts for gathering occurrence data, running forecast models, and creating map outputs.
  + main.R: describe what main.R does!
  + list each additional file in src/, and give a brief description of its purpose
+ Photos
  + Contains images used in repository

## How do I run the code?
The code used in this project is in R. Therefore, there are two options:

### RStudio Cloud
Might have issues with crashing -- will investigate more later

### RStudio Desktop
Provide step-by-step instructions on how one would clone this repository, run the code, and replicate the output. You may want to provide instructions for running your repository on a local instance of RStudio, and for a user on rstudio.cloud (there may be subtle differences in getting started).
>>>>>>> 4addd82548137703c002ce15991623c7f8a0c935
