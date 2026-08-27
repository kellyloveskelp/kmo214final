# The input to this function should be a data frame containing stream chemistry data
moving_average <- function(dataset) {
  # Initialize a tibble to contain the results
  result <- tibble(
    window_start = seq(
      ymd("1988-01-01"),
      ymd("1994-12-31"),
      by = "9 weeks"
    ),
    Sample_ID = NA,
    `NO3-N` = NA,
    `NH4-N` = NA,
    K = NA,
    Mg = NA,
    Ca = NA
  )

  # Fill in the iterator and sequence
  for (d in 1:nrow(result)) {
    # Create variables for the start and end of the current window
    w1 <- result$window_start[d]
    w2 <- w1 + weeks(9)

    # Create a logical vector, called "in_window", that says which samples are inside the window
    # Hint: you'll compare sample dates to the start and end of the window
    in_window <- dataset$Sample_Date >= w1 & dataset$Sample_Date < w2

    # Use indexing to pull out the ion concentrations that fall inside the window
    NO3_window <- dataset$`NO3-N`[in_window]
    NH4_window <- dataset$`NH4-N`[in_window]
    K_window <- dataset$K[in_window]
    Mg_window <- dataset$Mg[in_window]
    Ca_window <- dataset$Ca[in_window]
    # The line above gets potassium in the window. Get the rest of the ions too

    # Calculate the mean of each ion concentration and fill in the result
    result$`NO3-N`[d] <- mean(NO3_window, na.rm = TRUE)
    result$`NH4-N`[d] <- mean(NH4_window, na.rm = TRUE)
    result$K[d] <- mean(K_window, na.rm = TRUE)
    result$Mg[d] <- mean(Mg_window, na.rm = TRUE)
    result$Ca[d] <- mean(Ca_window, na.rm = TRUE)

    # Fill in Sample_ID column
    result$Sample_ID <- first(dataset$Sample_ID)
  }

  # Return the result
  return(result)
}
