## **SRC:** Contains R scripts for gathering occurrence data, running forecast models, and creating map outputs.
  + main.R: This script is a compilation of all code. It will install and load all required packages, clean the data, and generate all occurrence and distribution maps. Running this code is ideal for desktop RStudio, as its length may cause RStudio Cloud to crash.
  + sdm-functions.R: Functions used for SDM modelling scripts.
  + setup-for-current-and-future-sdm.R: Downloads climate data.
  + A-speciosa-sdm-current-single.R: Script for generating a current species distribution map.
  + A-speciosa-sdm-future-single.R: Script for generating a future (forecast) species distribution map.
  + A_speciosa_distribution_maps.R: Individual script for generating current and forecast distribution maps. Ideally for RStudio Cloud, where larger scripts may cause the console to crash.
  + A_speciosa_occurrence_map.R: Individual script for generating an occurrence map. Ideally for RStudio Cloud, where larger scripts may cause the console to crash.