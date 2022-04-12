######################### SPECIES DISTRIBUTION MODELS #########################

# Maxine Cruz, Deanna Sunnergren, and Caelan Wilkie-Rogers
# Spring 2022

# This A_speciosa_distribution_maps.R code will:

# (1) gather and clean data from GBIF, 
# (2) generate a current species distribution map, and
# (3) generate a future species distribution map





######################### INITIAL DOINGS: INSTALL PACKAGES AND LOAD LIBRARIES #########################

# NOTE: Assuming that you have run A_speciosa_occurrence_map.R before this, 
# you may be able to skip the installation and loading of libraries
# IF THAT IS THE CASE, skip to loading the functions (lines 46 and 52)

# List all the packages required to run this code
# Storing them in one place (required <-) makes it easier to install them in one go

required <- c("raster", "sp", "dismo", "maptools", "spocc", "rgdal", "sf", "maps")

# Install packages

install.packages(required)

# Load packages
# If these are not run, nothing in this script will either

library("raster")
library("sp")
library("dismo")
library("maptools")
library("spocc")
library("rgdal")
library("sf")
library("tidyverse")
library("maps")

# Load the functions used for species distribution modelling (SDM)

source("SRC/sdm-functions.R")

# The setup code below will download climate data from bioclim 
# Originally this also installed libraries, but if we run the entirety of main.R that isn't needed
# (https://www.worldclim.org/data/bioclim.html)

source(file = "SRC/setup-for-current-and-future-sdm.R")





######################### QUERYING DATA FROM GBIF #########################

# Earlier, we queried and filtered data for these SDMs
# Note line 94 in making an occurrence map: A_speciosa_SDM_data <- showy_milkweed

# But perhaps it might be good to limit the amount of data in this case, though
# To reduce the amount of processing

# IF INTERESTED IN INCLUDING MORE YEARS (WHICH WILL LIKELY TAKE MORE PROCESSING TIME)
# Omit the line including "gbifopts = list(year = "2019, 2020"),"

A_speciosa_SDM_data <- occ(query = "Asclepias speciosa",
                           from = "gbif",
                           gbifopts = list(year = "2019, 2020"),
                           limit = 9400)

# Filter data as before

A_speciosa_SDM_data <- A_speciosa_SDM_data$gbif$data$Asclepias_speciosa

# First, we need to ensure all data is character data

A_speciosa_SDM_data <- apply(A_speciosa_SDM_data, 2, as.character)

# Now we can save the data as a .csv file

write.csv(A_speciosa_SDM_data, "Data/A_speciosa.csv")





######################### GENERATE A CURRENT SDM MAP #########################

source("SRC/A-speciosa-sdm-current-single.R")





######################### GENERATE A FUTURE SDM MAP #########################

source("SRC/A-speciosa-sdm-future-single.R")




