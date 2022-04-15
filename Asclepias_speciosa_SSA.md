# Showy Milkweed (*Asclepias speciosa*) Species Status Assessment
### Host Plant of the Monarch butterfly (*Danaus plexippus*: Nymphalidae)

### [Github repository](https://github.com/BiodiversityDataScienceCorp/milkfli-mapping) || Zenodo

By: Deanna Sunnergren, Caelan Wilkie-Rogers, and Maxine Cruz || Created: March 2022

<img src = "https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/Photos/monarch_on_showy.jpg" width="50%" height="50%">

## About the Showy Milkweed (*A. speciosa*)

### Species Taxonomy:
+ **Kingdom:** Plantae (Plants) 
+ **Division:** Anthophyta (Flowering plants)
+ **Class:** Dicotyledoneae (Dicots)
+ **Order:** Gentianales (Dogbane / Gentian)
+ **Family:** Asclepiadaceae (Milkweeds)
+ **Species:** *Asclepias speciosa* (Showy Milkweed) 

### Species Description 
A stout, sparingly branched, pubescent perennial, 1 1/2-3 ft. tall, with large, oval, blue-green leaves and showy, spherical clusters of rose-colored flowers. Flowers occur at the top of the stem and on stalks from leaf axils. A grayish, velvety plant with erect leafy stems and with umbels of star-like pinkish flowers in upper axils and at top. Sap milky.” (wildflower.org) Milkweed can spread asexually through rhizomes or sexually with seeds. It does not spread aggressively. It is also drought tolerant once established. 


### Habitat Description
Found in a wide variety of habitats including savanas, prairies, roadsides, riverbanks, and wetlands. It can thrive in very wet and very dry conditions so it is considered equally likely to occur in wetlands or dry lands. 

### Larval Host Information
**Larvae feeds on *A. speciosa*:**
+ Monarch butterflies (*Danaus plexippus*: Nymphalidae)
+ Queen butterflies
+ Dogbane Tiger Moths
+ Red-Belted Clearwing Moth

**Foragers of *A. speciosa*:**
Honeybees, bumblebees, and other bee species! 

### Threats to the Species' Survival
**Pathogens:**
+ *Cercospora clavata*
+ *Cercospora elaeochroma*
+ *Cercospora venturiodes*
+ *Colletotrichum fusarioides*
+ *Phoma asclepoadea*
+ *Phoma rostrata*
+ *Puccinia bartholomaei*
+ *Puccinia seymouriana*
+ *Uromyces asclepiadis*

**Other threats:**
+ *Asclepias speciosa* is toxic to a variety of livestock, and although livestock generally avoid it because of its bitter taste, it is a target of removal by farmers and ranchers. 

### Conservation status
Showy milkweed (*Asclepias speciosa*) is listed as threatened in the state of Iowa. In some areas milkweed can become invasive due to its ability to outcompete other vegetation. 

## Data Sources
The data is primarily sourced from the Global Biodiversity Information Facility ([GBIF](https://www.gbif.org/species/3170260)), which consists of 

## Species Occurrence Map
The red dots on the map are recorded occurrences of Showy Milkweed (*Asclepias speciosa*). It is present throughout much of the United States from the Midwest to the Southwest and West Coast it is also present in Southwest Canada. There are several clusters of occurrences around densely populated parts of the United States. This may be the result of the plant's popularity with gardeners. 

### Methods
This map was created in RStudio with occurrence data collected from GBIF. GBIF was queried with a limit of 9,400 to include all observations of *Asclepias speciosa*. Data was then filtered for 'PRESENT' occurrences in North America (0 to 100 degrees latitude and -50 to -150 degrees longitude) and written to a csv. Points were then overlayed onto a map of the United States. 

<img src = "https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/Outputs/A_speciosa_occurrence_map.jpg" width="50%" height="50%">

## Current Species Distribution
The red dots on the map are recorded occurrences of Showy Milkweed (*Asclepias speciosa*) and the black shaded areas on the maps show where the plant could potentially grow. This is predicted by analyzing the climate variable in the areas where we have known occurrences of the plant and seeing where the correct conditions are present. Because this is by no means a perfectly accurate process, those areas should only be considered preliminary candidates for where the plant could occur. 

### Methods
This species distribution model (SDM) was created from code in RStudio originally made by Jeff Oliver that can be found here: [https://github.com/jcoliver/biodiversity-sdm-lesson](https://github.com/jcoliver/biodiversity-sdm-lesson). Data from [WorldClim](http://www.worldclim.org) and the previous GBIF query of species occurrences was inputted into the model to show the overlap between data points of known occurrences of *Asclepias speciosa* and locations where the current climate is predicted to be suitable for the species to inhabit (limited to the United States and parts of Canada).

<img src = "https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/Outputs/A_speciosa_single_current_sdm.jpg" width="75%" height="75%">

## Forecast Species Distribution (Estimation)
The red dots on the map are recorded occurrences of Showy Milkweed (*Asclepias speciosa*) and the black shaded areas on the maps show where the plant could potentially be growing in 2070 with climate change. Given the number of unknown variables related to climate change this prediction is far from perfect but gives a rough estimate of the changes in the range of the plant. According to this prediction there will be some thinning in sotable land in the Southernmost part of the United States. There will also be a large increase in the amount of suitable land in the northern United States and Southwest Canada. 

### Methods
Similar to the current SDM, this future SDM was created from code originally made by Jeff Oliver that can be found here: [https://github.com/jcoliver/biodiversity-sdm-lesson](https://github.com/jcoliver/biodiversity-sdm-lesson). The same GBIF occurrence data was used, but the predicted habitable range was created based on anticipated changes to the climate in the year 2070.

<img src = "https://github.com/BiodiversityDataScienceCorp/milkfli-mapping/blob/main/Outputs/A_speciosa_single_future_sdm.jpg" width="75%" height="75%">

## What do our findings suggest?
The habitable range seen in the current SDM spans a large portion of the Midwestern and Western United States. While the range appears to be slightly skewed towards the north, the current SDM includes areas all the way from the Mexican boarder to slightly over the Canadian boarder. The forecasted future SDM range is confined to a much more northerly area in comparison. This difference suggests the need for *Asclepia speciosa* to migrate north to remain in climates that are suitable for its survival. While the future SDM shows some areas in the Southwestern United States that may be capable of sustaining *Asclepias speciosa*, those areas are expected to be much smaller and more spread apart than they currently are. Furthermore, the southerly areas in the future SDM range are primarily situated closer to mountain ranges where higher altitudes may allow for cooler temperatures. Since *Asclepias speciosa* is a prominent larval host and food source for Monarch butterflies (*Danaus plexippus*) as well as other pollinators and insects, the migration of *Asclepias speciosa* to the north could impact the amount of plants available for use by these animals in the Southwestern United States.

### References
+ https://www.xerces.org/sites/default/files/2018-05/17-031_02_XercesSoc_Milkweeds-Conservation-Guide_web.pdf
+ https://www.frontiersin.org/articles/10.3389/fevo.2019.00168/full
+ gardenerspath.com (Larval host information)
+ https://www.fws.gov/media/monarch-butterfly-showy-milkweed (Monarch on Showy Milkweed image)
