######################### Data cleaning and map generation for Showy Milkweed (*Asclepias speciosa*) data #########################

# Maxine Cruz, Deanna Sunnergren, and Caelan Wilkie-Rogers
# Spring 2022

# This main.R code will:
# (1) gather data from GBIF,
# (2) generate a species occurrence map,
# (3) generate a current species distribution map, and
# (4) generate a future (forecast) species distribution map





######################### INITIAL DOINGS: INSTALL PACKAGES AND LOAD LIBRARIES #########################

# List all the packages required to run this code
# Storing them in one place (required <-) makes it easier to install them in one go

required <- c("raster", "sp", "dismo", "maptools", "spocc", "rgdal", "sf", "tidyverse", "maps", "ggplot2", "rnaturalearth", "rnaturalearthdata")

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

# If we run showy_milkweed

# This gives us:

# Searched: gbif
# Occurrences - Found: 9,353, Returned: 9,353
# Search type: Scientific
#   gbif: Asclepias speciosa (9353)

# We will also want a copy for the SDM maps later

# But perhaps it might be good to limit the amount of data in this case,
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

showy_milkweed <- showy_milkweed$gbif$data$Asclepias_speciosa
A_speciosa_SDM_data <- A_speciosa_SDM_data$gbif$data$Asclepias_speciosa


######## Cleaning the data: occurenceStatus ########

# occurrenceStatus is data on whether the species was present or absent at a location

# This site gives the description for each of the columns in the data:
# https://dwc.tdwg.org/terms/#dwc:occurrenceStatus (for occurrenceStatus)

# This function checks for different values under occurrenceStatus in the GBIF data

unique(showy_milkweed$occurrenceStatus)

# The result from running this gives:
# [1] PRESENT

# This suggests that A. speciosa was present at said locations in the data

# Since the function did not return "ABSENT" or any other values, 
# we can assume that there is no need to filter for only "PRESENT" values

# [IN THE CASE THAT "ABSENT" IS RETURNED AFTER RUNNING UNIQUE()]

# Here we can use the subset function to return rows from 
# the original data set based on a condition we specify
# In this case, the subset is for values that are not equal to "PRESENT"

# absent <- subset(x = showy_milkweed, occurrenceStatus !="PRESENT")

# Now we can use anti_join to redefine our data set by 
# subtracting the "ABSENT" rows from it

# The anti_join function will look at two tables that are inputted,
# then it will create a new table of values based on the former table that are
# not present in the latter table (a.k.a. the PRESENT data in this case)

# showy_milkweed <- anti_join(showy_milkweed, absent)

# An alternative method could be using filter()


######## Cleaning the data: individualCount ########

# individualCount is the number of individuals observed at the time of occurrence

# The same procedure used for occurrenceStatus can be done here

# First, use unique() to find the different values under this data column

unique(showy_milkweed$individualCount)

# This will return:
# [1] NA  1  2  4  6  3

# It might be good to filter out the NA values

# Under the assumption that we only need to filter cases where the
# value is 0, we can assume there is no need to filter individualCount

# In any case, we can have an alternate dataset with the NA omitted

# Check to see if NA values were removed
# Create a separate dataset where NA values are omitted

showy_milkweed_noNA <- showy_milkweed[!is.na(showy_milkweed$individualCount), ]

# This returns:
# [1] 1 2 4 6 3

# [IN THE CASE THAT 0 IS RETURNED AFTER RUNNING UNIQUE()]

# zero <- subset(x = showy_milkweed, individualCount == 0)
# showy_milkweed <- anti_join(showy_milkweed, zero)


######## For the purposes of mapping ########

# If NA values occur in the latitude and longitude,
# it may interfere with centering the map later on
# We can create a separate data set where the NA values are omitted

# First filter the latitude NA

showy_milkweed_noNA_coord <- showy_milkweed[!is.na(showy_milkweed$latitude), ]

# Then filter the longitude NA

showy_milkweed_noNA_coord <- showy_milkweed[!is.na(showy_milkweed$longitude), ]


######## Cleaning the data: errors in lat/long ########

# We can first plot a map to visually assess whether points need to be removed

# Because it would not make sense to have milkweed data 
# in the middle of the Pacific now, would it?

# The following generates a sample map

# world_map <- borders("world", colour="gray50", fill="gray50")

# sample_map <- ggplot() + 
#   coord_fixed() + 
#   world_map +
#   geom_point(data = showy_milkweed,
#              aes(x = longitude, y = latitude),
#              colour = "darkred", 
#              size = 1.0) +
#   theme_bw()

# This results in a map showing that A. speciosa is primarily in N. America
# There are a few points in Europe and Africa, and it is possible that
# these occurrences are native or established
# But in our case, we are interested in the occurrences in the Americas
# So we can modify our data to showcase only points in America

# We can see that the points in the Americas are mostly between
# Latitude: 0 degrees and 100 degrees
# Longitude: -50 degrees and -150 degrees

# Therefore, we can filter the data to those within those boundaries

# showy_milkweed <- showy_milkweed %>% 
#  filter(latitude <= 100 & latitude >= 0) %>%
#  filter(longitude <= -50 & longitude >= -150)

# Replot data on world map to ensure filtering was correct

# sample_map_2 <- ggplot() + 
#   coord_fixed() + 
#   world_map +
#   geom_point(data = showy_milkweed,
#              aes(x = longitude, y = latitude),
#              colour = "darkred", 
#              size = 1.0) +
#   theme_bw()

# This map shows that our filtering efforts were effective

# Apply the same filter to other two data sets

showy_milkweed_noNA <- showy_milkweed_noNA %>% 
  filter(latitude <= 100 & latitude >= 0) %>%
  filter(longitude <= -50 & longitude >= -150)

showy_milkweed_noNA_coord <- showy_milkweed_noNA_coord %>% 
  filter(latitude <= 100 & latitude >= 0) %>%
  filter(longitude <= -50 & longitude >= -150)


######## Ensure that there are no duplicates in the data ########

# We do not need showy_milkweed anymore because that includes NA values
# So we only save what we need

showy_milkweed_noNA <- distinct(showy_milkweed_noNA)
showy_milkweed_noNA_coord <- distinct(showy_milkweed_noNA_coord)
A_speciosa_SDM_data <- distinct(A_speciosa_SDM_data)


######## Reduce columns in the data ########

# We do not need all the columns given by GBIF
# So we can keep what will, or might be necessary

showy_milkweed_noNA <- select(showy_milkweed_noNA, 
                              c(name, latitude, longitude,
                                scientificName, publishingCountry, stateProvince,
                                year, month, day, eventDate, individualCount))

showy_milkweed_noNA_coord <- select(showy_milkweed_noNA_coord, 
                                    c(name, latitude, longitude,
                                      scientificName, publishingCountry, stateProvince,
                                      year, month, day, eventDate, individualCount))


# Extra step for SDM data: Need to ensure all data is character data

A_speciosa_SDM_data <- apply(A_speciosa_SDM_data, 2, as.character)


######## Save data as .csv file ########

write_csv(showy_milkweed_noNA, "Data/showy_milkweed_noNA.csv")
write_csv(showy_milkweed_noNA_coord, "Data/showy_milkweed_noNA_coord.csv")
write.csv(A_speciosa_SDM_data, "Data/A_speciosa.csv")

# Note: The "Data/" sends these files to the Data folder





######################### SPECIES OCCURRENCE MAP #########################

######## Load .csv data file for mapping ########

showy_milkweed_noNA_coord <- read_csv("Data/showy_milkweed_noNA_coord.csv")
showy_milkweed_noNA <- read_csv("Data/showy_milkweed_noNA.csv")


######## Determine max and min latitudes and longitudes to center map ########

# Now, we can make a nice map
# We do not want an off-centered map -- because really, who wants that?
# So it would be good to find the boundaries of where the data are
# In doing so, we can plot a map that is focused in on that region

# ceiling() gives the smallest integer that is greater than or equal to a value
# max() gives the largest value of the column data
# So if the highest value in dataset$latitude is 46.5, then its ceiling is 47

max.lat <- ceiling(max(showy_milkweed_noNA_coord$latitude))

# floor() and min() work similarly (but opposite)
# If the lowest value of dataset$latitude is 43.84, then its floor is 43

min.lat <- floor(min(showy_milkweed_noNA_coord$latitude))

# Run the same calculations for longitude

max.lon <- ceiling(max(showy_milkweed_noNA_coord$longitude))
min.lon <- floor(min(showy_milkweed_noNA_coord$longitude))


######## Mapping points for A. speciosa ########

# Helps format the map (to be honest, not sure what this does yet but it's necessary)

world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

# Mapping the points using ggplot()!

occ_map <- ggplot(data = world) +
  geom_sf() +
  coord_sf(xlim = c(min.lon-5, max.lon+5), ylim = c(min.lat-5, max.lat+5)) + # The -5 and +5 extend the boundary a little
  geom_point(data = showy_milkweed_noNA, aes(longitude, latitude, color = "coral1"), show.legend = FALSE) +
  borders("state") + # Adds state borders
  labs(title = "Occurrences of *Asclepias speciosa* in Northern America",
       x = "Longitude",
       y = "Latitude") 

# This indicates we are done with plotting and saving to .jpg

ggsave("Outputs/A_speciosa_occurrence_map.jpg", plot = occ_map)

# [THE FOLLOWING WAS CODE USED TO CREATE THE ORIGINAL MAP]
# [IN THE INTEREST OF MAKING A PRETTIER MAP, THE CODE ABOVE DOES JUST THAT]

# This indicates that we want to save the next output as "mapname.jpg"

# jpeg(file = "Outputs/A_speciosa_occurrence_map.jpg")

# This loads spatial polygons
# Spatial polygons are shapes/polygons that represent a geographic location

# data(wrld_simpl)

# Plot the base map

# plot(wrld_simpl, 
#     xlim = c(min.lon, max.lon), # Sets upper/lower x
#     ylim = c(min.lat, max.lat), # Sets upper/lower y
#     xlab = "Longitude",
#     ylab = "Latitude",
#     axes = TRUE, 
#     col = "grey95",
#     main = "*Asclepias speciosas* Occurrences in North America")

# Add the points for individual observations

# points(x = csv_showy_milkweed_noNA_coord$longitude, 
#       y = csv_showy_milkweed_noNA_coord$latitude,
#       col = "coral1", 
#       pch = 20, 
#       cex = 0.75)

# And draw a little box around the graph

# box()

# This indicates we are done with plotting and saving to .jpeg

# dev.off()

# An occurrence map for the Showy Milkweed should have been generated at this point
# The .jpg can be found in the Outputs folder





######################### SPECIES DISTRIBUTION MODELS #########################

######## INITIAL DOINGS: LOADING FUNCTIONS AND CLIMATE DATA ########

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


######## GENERATE A CURRENT SDM MAP ########

source("SRC/A-speciosa-sdm-current-single.R")


######## GENERATE A FUTURE SDM MAP ########

source("SRC/A-speciosa-sdm-future-single.R")


