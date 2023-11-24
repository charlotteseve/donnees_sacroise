# Load packages
library(targets)
library(tarchetypes)

# Load functions in R file
tar_source()

# Creating pipeline
list(
  
  tar_target(raw_data, "sar_med"),
  
  # download data
  tar_target(data, ld_data(raw_data)),
  
  # change encoding
  tar_target(data_clean, change_capture(data$capture, "sar_med"))

  

  
  
)