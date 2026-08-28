#install.packages("ggplot2")
library(ggplot2)
library(tidyverse)

## My own asthetic

# Color options
dark_teal <- "#092328"
light_teal <- "#12544F"
med_green <- "#2A835F"
light_green <- "#8BBB92"

light_grey <- "#999999"
med_grey <- "#777777"
dark_grey <- "#333333"
black <- "#000000"


my_theme <- function() {
  theme_minimal(
    base_family = "Avenir Next",
  ) +
    theme(
      plot.title = element_text(
        size = 18,
        face = "bold",
        color = "#12544F", # dark teal
        margin = margin(b = 10),
        hjust = 0.5 #centered
      ),
      plot.subtitle = element_text(
        size = 14,
        face = "italic",
        color = "#12544F", # light teal
        margin = margin(b = 10),
        hjust = 0.5 #centered
      ),
      plot.caption = element_text(
        size = 13,
        color = "#999999", # light grey
        margin = margin(t = 15),
        hjust = 0
      ),
      axis.title = element_text(
        size = 12,
        face = "bold",
        color = "#12544F", # light teal
      ),
      axis.text = element_text(
        size = 10,
        face = "plain",
        color = "#777777", # medium grey
      ),
      # grid look
      panel.grid.minor = element_line(
        linetype = "dashed",
        linewidth = 0.15,
        color = "#999999"
      ),
      panel.grid.major = element_line(
        linetype = "dashed",
        linewidth = 0.15,
        color = "#999999"
      ),
    )
}
