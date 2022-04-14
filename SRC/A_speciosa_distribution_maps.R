######################### SPECIES DISTRIBUTION MODELS #########################

# Maxine Cruz, Deanna Sunnergren, and Caelan Wilkie-Rogers
# Spring 2022

# This A_speciosa_distribution_maps.R code will:

# (1) gather and clean data from GBIF, 
# (2) generate a current species distribution map, and
# (3) generate a future species distribution map





######################### INITIAL DOINGS: INSTALL PACKAGES AND LOAD LIBRARIES #########################

# NOTE: If A_speciosa_occurrence_map.R was run beforehand,
# You can skip to line 49

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
library("rnaturalearth")
library("rnaturalearthdata")





######################### QUERYING DATA FROM GBIF #########################

# Query (retrieve data on) A. speciosa

# Our species is Asclepias speciosa (Showy milkweed)
# Link to GBIF: https://www.gbif.org/species/3170260

# Similar process as making an occurrence map, but
# Perhaps it might be good to limit the amount of data in this case
# To reduce the amount of and time spent processing

# IF INTERESTED IN INCLUDING MORE YEARS (WHICH WILL LIKELY TAKE MORE PROCESSING TIME)
# Omit the line including "gbifopts = list(year = "2019, 2020"),"

A_speciosa_SDM_data <- occ(query = "Asclepias speciosa",
                           from = "gbif",
                           gbifopts = list(year = "2019, 2020"),
                           limit = 9400)





######################### CLEANING THE GBIF DATA: OCCURENCE MAP #########################

######## Refine query results ########

# We only want the milkweed data (and not all the other things that came with the query)
# Using the "$" notation helps to create a variable targeting the data set

A_speciosa_SDM_data <- A_speciosa_SDM_data$gbif$data$Asclepias_speciosa


######## Cleaning the data: occurenceStatus ########

# occurrenceStatus is data on whether the species was present or absent at a location

# This site gives the description for each of the columns in the data:
# https://dwc.tdwg.org/terms/#dwc:occurrenceStatus (for occurrenceStatus)

# This function checks for different values under occurrenceStatus in the GBIF data

unique(A_speciosa_SDM_data$occurrenceStatus)

# The result from running this gives:
# [1] PRESENT

# This suggests that A. speciosa was present at said locations in the data

# Since the function did not return "ABSENT" or any other values, 
# we can assume that there is no need to filter for only "PRESENT" values

# [IN THE CASE THAT "ABSENT" IS RETURNED AFTER RUNNING UNIQUE()]

# Here we can use the subset function to return rows from 
# the original data set based on a condition we specify
# In this case, the subset is for values that are not equal to "PRESENT"

# absent <- subset(x = A_speciosa_SDM_data, occurrenceStatus !="PRESENT")

# Now we can use anti_join to redefine our data set by 
# subtracting the "ABSENT" rows from it

# The anti_join function will look at two tables that are inputted,
# then it will create a new table of values based on the former table that are
# not present in the latter table (a.k.a. the PRESENT data in this case)

# A_speciosa_SDM_data <- anti_join(A_speciosa_SDM_data, absent)

# An alternative method could be using filter()


######## Cleaning the data: individualCount ########

# individualCount is the number of individuals observed at the time of occurrence

# The same procedure used for occurrenceStatus can be done here

# First, use unique() to find the different values under this data column

unique(A_speciosa_SDM_data$individualCount)

# This will return:
# [1] NA  1  2  4  6  3

# It might be good to filter out the NA values

# Under the assumption that we only need to filter cases where the
# value is 0, we can assume there is no need to filter individualCount

# In any case, we can have an alternate dataset with the NA omitted

# Check to see if NA values were removed
# Create a separate dataset where NA values are omitted

A_speciosa_SDM_data <- A_speciosa_SDM_data[!is.na(A_speciosa_SDM_data$individualCount), ]

# This returns:
# [1] 1 2 4 6 3

# [IN THE CASE THAT 0 IS RETURNED AFTER RUNNING UNIQUE()]

# zero <- subset(x = A_speciosa_SDM_data, individualCount == 0)
# A_speciosa_SDM_data <- anti_join(A_speciosa_SDM_data, zero)

# Ensure that there are no duplicates in the data

A_speciosa_SDM_data <- distinct(A_speciosa_SDM_data)

# Need to ensure all data is character data

A_speciosa_SDM_data <- apply(A_speciosa_SDM_data, 2, as.character)


######## Save data as .csv file ########

write.csv(A_speciosa_SDM_data, "Data/A_speciosa.csv")

# Note: The "Data/" sends these files to the Data folder





######################### INITIAL DOINGS: LOADING FUNCTIONS AND CLIMATE DATA #########################

# Load the functions used for species distribution modelling (SDM)

source("SRC/sdm-functions.R")

# The setup code below will download climate data from bioclim 
# Originally this also installed libraries, but if we run the entirety of main.R that isn't needed
# (https://www.worldclim.org/data/bioclim.html)

# NOTE: The climate data that is downloaded from here will not work for the forecast
# This issue is resolved with the code after the following

source(file = "SRC/setup-for-current-and-future-sdm.R")

# The code below downloads and unzips climate data for the FUTURE SDM

future <- c("forecast1.zip", "forecast2.zip", "forecast3.zip", "forecast4.zip")

# This loop goes through the future vector, downloads and unzips each file

for (file in future){
  urlFuture <- paste("https://climatedata.watzekdi.net/",file, sep = "")
  destfileFuture <- file
  download.file(urlFuture, destfileFuture)
  message("Extracting future climate data (this may take a moment)")
  unzip(zipfile = file, exdir=".")
  file.remove(file)
}


######################### GENERATE A CURRENT SDM MAP #########################

source("SRC/A-speciosa-sdm-current-single.R")


######################### GENERATE A FUTURE SDM MAP #########################

source("SRC/A-speciosa-sdm-future-single.R")


