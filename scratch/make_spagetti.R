## This is my first attempt to create a plot of the Schaefer et al. 2000 data

library(tidyverse)

cuenca1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
cuenca2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
cuenca3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
puente_roto <- read_csv("data/RioMameyesPuenteRoto.csv")

glimpse(cuenca2)

# Join all cuenca datasets 
# binded_data <- bind_rows(cuenca1, cuenca2, cuenca3, puente_roto)
# Not yet

# Create tibble to average every 9 days
cuenca1_smoothed <- tibble(
  window_start = seq(
    ymd("1984-05-20"),
    ymd("2020-12-29"),
    by = "9 days"
  ),
  Sample_ID = NA,
  `NO3-N` = NA,
  `NH4-N` = NA,
  K = NA,
  Mg = NA,
  Ca = NA
)

cuenca2_smoothed <- tibble(
  window_start = seq(
    ymd("1984-05-20"),
    ymd("2020-12-29"),
    by = "9 days"
  ),
  Sample_ID = NA,
  `NO3-N` = NA,
  `NH4-N` = NA,
  K = NA,
  Mg = NA,
  Ca = NA
)

cuenca3_smoothed <- tibble(
  window_start = seq(
    ymd("1984-05-20"),
    ymd("2020-12-29"),
    by = "9 days"
  ),
  Sample_ID = NA,
  `NO3-N` = NA,
  `NH4-N` = NA,
  K = NA,
  Mg = NA,
  Ca = NA
)

roto_smoothed <- tibble(
  window_start = seq(
    ymd("1984-05-20"),
    ymd("2020-12-29"),
    by = "9 days"
  ),
  Sample_ID = NA,
  `NO3-N` = NA,
  `NH4-N` = NA,
  K = NA,
  Mg = NA,
  Ca = NA
)

# Iterate through qs_smoothed by window start dates, aka every 9 days
# Take the average of ion conc respectively given the sample dates within the window
# We need to define which sample dates fall within the windows

# CUENCA 1

for (d in 1:nrow(cuenca1_smoothed)) {
  # for some number from 1 to the number of rows in qs_smoothed
  # What's the start and end of the window? Let's call it w1 and w2
  w1 <- cuenca1_smoothed$window_start[d]
  w2 <- w1 + 9
  print(w1)
  print(w2)
  data_window <- filter(cuenca1, (Sample_Date >= w1 & Sample_Date < w2))
  print(data_window)
  #cuenca1_smoothed$Sample_ID[d] <- first(data_window$Sample_ID)
  cuenca1_smoothed$`NO3-N`[d] <- mean(data_window$`NO3-N`, na.rm = TRUE)
  cuenca1_smoothed$`NH4-N`[d] <- mean(data_window$`NH4-N`, na.rm = TRUE)
  cuenca1_smoothed$K[d] <- mean(data_window$K, na.rm = TRUE)
  cuenca1_smoothed$Mg[d] <- mean(data_window$Mg, na.rm = TRUE)
  cuenca1_smoothed$Ca[d] <- mean(data_window$Ca, na.rm = TRUE)
} 
cuenca1_smoothed$Sample_ID <- first(cuenca1$Sample_ID)

# CUENCA 2

for (d in 1:nrow(cuenca2_smoothed)) {
  # for some number from 1 to the number of rows in qs_smoothed
  # What's the start and end of the window? Let's call it w1 and w2
  w1 <- cuenca2_smoothed$window_start[d]
  w2 <- w1 + 9
  print(w1)
  print(w2)
  data_window <- filter(cuenca2, (Sample_Date >= w1 & Sample_Date < w2))
  print(data_window)
  cuenca2_smoothed$`NO3-N`[d] <- mean(data_window$`NO3-N`, na.rm = TRUE)
  cuenca2_smoothed$`NH4-N`[d] <- mean(data_window$`NH4-N`, na.rm = TRUE)
  cuenca2_smoothed$K[d] <- mean(data_window$K, na.rm = TRUE)
  cuenca2_smoothed$Mg[d] <- mean(data_window$Mg, na.rm = TRUE)
  cuenca2_smoothed$Ca[d] <- mean(data_window$Ca, na.rm = TRUE)
}
cuenca2_smoothed$Sample_ID <- first(cuenca2$Sample_ID)

# CUENCA 3

for (d in 1:nrow(cuenca3_smoothed)) {
  # for some number from 1 to the number of rows in qs_smoothed
  # What's the start and end of the window? Let's call it w1 and w2
  w1 <- cuenca3_smoothed$window_start[d]
  w2 <- w1 + 9
  print(w1)
  print(w2)
  data_window <- filter(cuenca3, (Sample_Date >= w1 & Sample_Date < w2))
  print(data_window)
  cuenca3_smoothed$`NO3-N`[d] <- mean(data_window$`NO3-N`, na.rm = TRUE)
  cuenca3_smoothed$`NH4-N`[d] <- mean(data_window$`NH4-N`, na.rm = TRUE)
  cuenca3_smoothed$K[d] <- mean(data_window$K, na.rm = TRUE)
  cuenca3_smoothed$Mg[d] <- mean(data_window$Mg, na.rm = TRUE)
  cuenca3_smoothed$Ca[d] <- mean(data_window$Ca, na.rm = TRUE)
}
cuenca3_smoothed$Sample_ID <- first(cuenca3$Sample_ID)

# PUENTE ROTO

for (d in 1:nrow(roto_smoothed)) {
  # for some number from 1 to the number of rows in qs_smoothed
  # What's the start and end of the window? Let's call it w1 and w2
  w1 <- roto_smoothed$window_start[d]
  w2 <- w1 + 9
  print(w1)
  print(w2)
  data_window <- filter(puente_roto, (Sample_Date >= w1 & Sample_Date < w2))
  print(data_window)
  roto_smoothed$`NO3-N`[d] <- mean(data_window$`NO3-N`, na.rm = TRUE)
  roto_smoothed$`NH4-N`[d] <- mean(data_window$`NH4-N`, na.rm = TRUE)
  roto_smoothed$K[d] <- mean(data_window$K, na.rm = TRUE)
  roto_smoothed$Mg[d] <- mean(data_window$Mg, na.rm = TRUE)
  roto_smoothed$Ca[d] <- mean(data_window$Ca, na.rm = TRUE)
}
roto_smoothed$Sample_ID <- first(puente_roto$Sample_ID)

# Now bind data
binded_data <- bind_rows(
  cuenca1_smoothed, cuenca2_smoothed, cuenca3_smoothed, roto_smoothed
)

# Pivot data in cuenca1 for visuallization
pivot_data <- binded_data |>
  pivot_longer(
    cols = c(`NO3-N`, `NH4-N`, K, Mg, Ca),
    names_to = "Ions",
    values_to = "Concentration"
  )

# Make a plot of concentration over time

ggplot(
  data = pivot_data,
  mapping = aes(
    x = window_start,
    y = Concentration,
    color = Sample_ID
  )
) +
  geom_line() +
  theme_classic(
  ) +
  labs(
    title = "Ion Concentration over Time",
    x = "Sampling Dates",
    y = "Concentration of Ion (mg/l)"
  ) +
  facet_wrap(~Ions, scales = "free")

