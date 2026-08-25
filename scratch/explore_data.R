library(tidyverse)

streams <- read_csv("data/knb-lter-luq.20.4923064/BasicFieldData-Streams.csv")
luq_lter <- read_csv("data/knb-lter-luq.20.4923064/LUQ LTER MDLs.csv")
cuenca1 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca1-Bisley.csv")
cuenca2 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca2-Bisley.csv")
cuenca3 <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca3-Bisley.csv")

glimpse(cuenca2)
