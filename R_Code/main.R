######## Initial doings ########

# Load packages
library("spocc")
library("sp")
library("raster")
library("maptools")
library("rgdal")
library("dismo")
library("sf")

# Load our functions
source("src/functions.R")



######## Species Occurrence map ########

### Query (retrieve data on) Asclepias speciosa ###

# Initially (without the limit), we will only get 500/9353 observations:

# Searched: gbif
# Occurrences - Found: 9,353, Returned: 500
# Search type: Scientific
#   gbif: Asclepias speciosa (500)

# But now that we know what the maximum number of observations is (9353),
# we can add the limit so that it includes all observations.

showy_milkweed <- occ(query = "Asclepias speciosa",
                      from = "gbif",
                      limit = 9400)

showy_milkweed

# This gives us:

# Searched: gbif
# Occurrences - Found: 9,353, Returned: 9,353
# Search type: Scientific
#   gbif: Asclepias speciosa (9353)


### Cleaning the data ###

# Filter out points that suggest there was not exactly an observation

# Remove data where occurrenceStatus is "Absent"

# Remove data where individualCount is 0

# Remove data that are obvious outliers on the map

# Reduce columns to only what is necessary, and save as .csv file


### Plotting the occurrence map ###



