# Repository for Making Species Occurrence and Distribution maps for the Showy Milkweed (*Asclepias speciosa*)
### Maxine Cruz, Caelan Wilkie-Rogers, and Deanna Sunnergren

![](https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/Photos/butterfly-gcb28d2610_1280.jpg)

## Overview
The **Showy Milkweed (*Asclepias speciosa*)** is one of various host plants to monarch butterflies (*Danaus plexippus*: Nymphalidae). Monarch populations have been observed to be declining at an average rate, with respect to other butterfly species, in the United States. However, the number of migratory individuals that return from overwintering sites has also been declining -- likely as a result of climate change. Plants, of course, are also affected by this change. Therefore, understanding the occurrences and distribution of monarch host plants may be key in their long-term conservation efforts. 

This repository serves to examine occurrences and the current and future distributions of the **Showy Milkweed** populations in North America. Data from the Global Biodiversity Information Facility (GBIF), an open-access source of biodiversity data from several sources (including, but not limited to, iNaturalist, USGS, and museum collections), was utilized in this project. 

A [Species Status Assessment](https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/SSA.md) of the Showy Milkweed was created and resides in the Outputs folder of this repository. This document contains information on the species, data cleaning process, and generated occurrence and distribution maps. At the end of the day, this repository is a documentation of the methods and analysis used towards Showy Milkweed data.

Many thanks to Jeff Oliver for the code used in species distribution modelling! This borrowed code can be found at [https://github.com/jcoliver/biodiversity-sdm-lesson](https://github.com/jcoliver/biodiversity-sdm-lesson).

## Dependencies
The following additional R packages are required (these will be installed when running the main script, `SRC/main.R`):

+ dismo
+ ggplot2
+ maps
+ maptools
+ rnaturalearth
+ rnaturalearthdata
+ raster
+ rgdal
+ sf
+ sp
+ spocc
+ tidyverse

(If running code through RStudio Cloud, these can be installed when running)

## Structure
### **Asclepias_speciosa_SSA.md:** 
  + Species Status Assessment for the Showy Milkweed (*Asclepias speciosa*)
### **Data:** Contains data used for occurrence and distribution maps
  + A_speciosa.csv: Data harvested from [GBIF](https://www.gbif.org/) for Showy Milkweed (*A. speciosa*). This dataset is not under version control, but will be harvested by running `main.R`. Same as showy_milkweed.csv, but is used for SDM maps -- filtered to data from 2019 ad 2020 (but this can be changed).
  + cmip5: Forecast climate data at 2.5 minute resolution from [WorldClim](http://www.worldclim.org). These data were originally downloaded from the WorldClim website, but stored in the `.RData` format for ease of use. The data are for the year 2070, based on the GFDL-ESM2G model with an RCP of 4.5 CO<sub>2</sub>. For an examination of different forecast models, see [McSweeney et al. 2015](https://link.springer.com/article/10.1007/s00382-014-2418-8). (_note_: this folder is not under version control, but will be created by running `main.R`).
  + showy_milkweed.csv: Data harvested from [GBIF](https://www.gbif.org/) for Showy Milkweed (*A. speciosa*). This dataset is not under version control, but will be harvested by running `main.R`. Same as A_speciosa.csv, but is used for species occurrence map -- filtered to data with latitude and longitude (e.g., no N/A values).
  + showy_milkweed_noNA.csv: Filtered version of showy_milkweed.csv. Omits individual counts with a value of NA.
  + showy_milkweed_noNA_coord.csv: Filtered version of showy_milkweed.csv. Omits latitudes and longitudes with a value of NA.
  + wc2-5: Climate data at 2.5 minute resolution from [WorldClim](http://www.worldclim.org) (_note_: this folder is not under version control, but will be created by running `main.R`).
### **SRC:** Contains R scripts for gathering occurrence data, running forecast models, and creating map outputs.
  + main.R: This script is a compilation of all code. It will install and load all required packages, clean the data, and generate all occurrence and distribution maps. Running this code is ideal for desktop RStudio, as its length may cause RStudio Cloud to crash.
  + sdm-functions.R: Functions used for SDM modelling scripts.
  + setup-for-current-and-future-sdm.R: Downloads climate data.
  + A-speciosa-sdm-current-single.R: Script for generating a current species distribution map.
  + A-speciosa-sdm-future-single.R: Script for generating a future (forecast) species distribution map.
  + A_speciosa_distribution_maps.R: Individual script for generating current and forecast distribution maps. Ideally for RStudio Cloud, where larger scripts may cause the console to crash.
  + A_speciosa_occurrence_map.R: Individual script for generating an occurrence map. Ideally for RStudio Cloud, where larger scripts may cause the console to crash.
### **Outputs** (contents are not under version control): Contains generated maps
  + showy_milkweed_occurrence_map.jpg: Occurrence map of *A. speciosa*
  + A_speciosa_single_current_sdm.jpg: Current SDM map of *A. speciosa*
  + A_speciosa_single_future_sdm.jpg: Current SDM map of *A. speciosa*
### **Photos:** Contains images used in repository and documents
  + butterfly-gcb28d28d2610_1280.jpg: Open-source image from [Pixabay](https://pixabay.com/illustrations/butterfly-butterflies-monarch-3407357/) used in main README.md.
  + monarch_on_showy.jpg: Image used in Asclepias_speciosa_SSA.md.

## How do I run the code?
The code used in this project is in R script. Therefore, there are two options:

### RStudio Cloud
1) Run `install-packages-and-libraries.R`. This installs and loads all necessary libraries for generating all maps.
2) For an occurrence map, run `A_speciosa_occurrence_map.R`.
3) For a current and/or forecast estimate species distribution map, run `A_speciosa_distribution_maps.R`.

### RStudio Desktop
1) Under SRC, open `main.R`.
2) Run each line.
3) At `install.packages(required)` (line 26), you may be prompted to restart R. Don't panic, just agree to it.
4) Note: Some lines may take a bit longer than others, but just be patient. This includes querying for the data (`occ()`), downloading the climate data (lines 412 - 427), and generating the SDM maps (lines 432 and 437).

