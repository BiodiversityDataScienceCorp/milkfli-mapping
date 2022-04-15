######################### Installing necessary packages for map-making and data cleaning #########################

# Maxine Cruz, Deanna Sunnergren, and Caelan Wilkie-Rogers
# Spring 2022


######################### INSTALL PACKAGES AND LOAD LIBRARIES #########################

# List all the packages required to run this code
# Storing them in one place (required <-) makes it easier to install them in one go

required <- c("raster", "sp", "dismo", "maptools", "spocc", "rgdal", "sf", "tidyverse", 
              "maps", "ggplot2", "rnaturalearth", "rnaturalearthdata")

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
library("ggplot2")
library("rnaturalearth")
library("rnaturalearthdata")


