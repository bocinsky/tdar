library(tidyverse)
library(readxl)
library(magrittr)

tdar_integration_example_data <- "./data-raw/integration.xlsx" %>%
  readxl::read_excel()
devtools::use_data(tdar_integration_example_data)

