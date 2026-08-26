## This is my first attempt to create a plot of the Schaefer et al. 2000 data

library(tidyverse)

cuenca1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
cuenca2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
cuenca3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
puente_roto <- read_csv("data/RioMameyesPuenteRoto.csv")

glimpse(cuenca1)

# Source moving-average function
source("R/moving-average.R")

# Join all cuenca datasets
# binded_data <- bind_rows(cuenca1, cuenca2, cuenca3, puente_roto)
# Not yet

mov_avg_cuenca1 <- moving_average(cuenca1)
mov_avg_cuenca2 <- moving_average(cuenca2)
mov_avg_cuenca3 <- moving_average(cuenca3)
mov_avg_roto <- moving_average(puente_roto)

# Now bind data
bind_streams <- bind_rows(
  mov_avg_cuenca1,
  mov_avg_cuenca2,
  mov_avg_cuenca3,
  mov_avg_roto
)

# Pivot data in cuenca1 for visuallization
pivot_streams <- bind_streams |>
  pivot_longer(
    cols = c(`NO3-N`, `NH4-N`, K, Mg, Ca),
    names_to = "Ions",
    values_to = "Concentration"
  )

# Make a plot of concentration over time

ggplot(
  data = pivot_streams,
  mapping = aes(
    x = window_start,
    y = Concentration,
    color = Sample_ID
  )
) +
  geom_line() +
  theme_classic() +
  labs(
    title = "Ion Concentration over Time",
    x = "Sampling Dates",
    y = "Concentration of Ion (mg/l)"
  ) +
  facet_wrap(~Ions, nrow = 5, ncol = 1, scales = "free")
