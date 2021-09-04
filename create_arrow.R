library(tidyverse) # data science in R
library(arrow) # fast data types
library(tictoc) # timing code
library(haven) # package for reading in files from other softwares
library(purrr) # for maps or 'loops'


# a few inputs
data_rows <- 9789093 # number of rows in data
chunk_size <- 250000 # how many rows to read/write at a time.

# creates the iter list
first <- seq(0, data_rows, by = chunk_size)
# [1]       0   20000   40000   60000   80000 ... 9780000

# need to create an `arrow` and `parquet` folder in the `folder_path` directory.
sas_arrow <- function(first, max_rows = chunk_size, 
                        sas_file = "data/marathon.sas7bdat", 
                        folder_path = "arrow"){
  
  dat <- read_sas(sas_file, skip = first, n_max = max_rows)
  feather_fname <- stringr::str_c(folder_path, "/feather/", stringr::str_c("file_", sprintf("%.0f", first/1000) ,"k.feather"))
  parquet_fname <- stringr::str_c(folder_path, "/parquet/", stringr::str_c("file_", sprintf("%.0f", first/1000) ,"k.parquet"))
  arrow::write_feather(dat, feather_fname) # no compression codecs installed
  arrow::write_parquet(dat, parquet_fname) # no compression codecs installed
  print(first/1000)
}

tic()
purrr::map(first, ~sas_arrow(first = .x))
toc()
# 108.209 sec elapsed