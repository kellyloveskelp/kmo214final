# attempt to recreate figure 3 in Schaefer et al. 2000

library(tidyverse)

# source calling moving average function from R/ script
source("R/moving-average.R")

cuenca1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
cuenca2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
cuenca3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
puente_roto <- read_csv("data/RioMameyesPuenteRoto.csv")

# 'moving_average()' function creates 9-week averages for each ion
mov_avg_cuenca1 <- moving_average(cuenca1)
mov_avg_cuenca2 <- moving_average(cuenca2)
mov_avg_cuenca3 <- moving_average(cuenca3)
mov_avg_roto <- moving_average(puente_roto)

# combine individual datasets into one for processing
bind_streams <- bind_rows(
  mov_avg_cuenca1,
  mov_avg_cuenca2,
  mov_avg_cuenca3,
  mov_avg_roto
)

# pivot columns for easy visualization
pivot_streams <- bind_streams |>
  pivot_longer(
    cols = c(`NO3-N`, `NH4-N`, K, Mg, Ca),
    names_to = "Ions",
    values_to = "Concentration"
  )

# generates csv file as intermediate output
write_csv(pivot_streams, "output/clean_data.csv")
