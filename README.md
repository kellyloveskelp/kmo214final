## EDS 214: Analytical Workflows and Scientific Reproducibility

### The Spaghetti Code Challenge

#### *Aka, throw it in the script and see what sticks*

#### Introduction

This repository documents the analytical workflow to reproduce Figure 3 of Schaefer et al. 2000, as stated in the EDS 214 assignment goals. This figure visualizes the concentration of five minerals: NO3-N, NO4-N, Ca, K, and Mg in four different sample sites throughout Puerto Rico from May 1984 to December 2020. These sites include, \_\_.

![**Figure 3 from Schaefer et al. 2000.**](images/Screenshot%202026-08-25%20at%202.24.15%20PM.png){fig-align="center"}

### Contents

| Directory or File Name | Description |
|------------------------------------|------------------------------------|
| data/ | The data/ folder contains all the original, unmodified CSVs used to create the original figure in Schaefer et al. 2000. |
| make_spagetti.R | The make_spagetti.R script contains the functions that process CSVs in the data folder. |
|  |  |
|  |  |

### Data Access

All data used in this project can be found in the [EDI Data Portal](https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-luq.20.4923064){.uri}.

*Any necessary information on where data lives (e.g. is it housed in the repo, on a server, in a library/package etc.) and how to access it in order to run the code*

#### Authors

Kelly Morgan, GitHub Link

Consider hyperlinking collaborators’ GitHub profiles or other professional profile

#### References

Schaefer, Douglas. A., William H. McDowell, Fredrick N. Scatena, and Clyde E. Asbury. 2000. “Effects of Hurricane Disturbance on Stream Water Concentrations and Fluxes in Eight Tropical Forest Watersheds of the Luquillo Experimental Forest, Puerto Rico.” *Journal of Tropical Ecology* 16 (2): 189–207. <https://doi.org/10.1017/s0266467400001358>.