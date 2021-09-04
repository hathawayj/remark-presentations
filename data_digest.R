library(tidyverse) # data science in R
library(arrow) # fast data types
library(tictoc) # timing code
library(haven) # package for reading in files from other softwares
library(purrr) # for maps or 'loops'

# Parsing from file format to tibble::tibble()

# https://www.dropbox.com/s/pck9qnwmbo4vjsi/marathon.csv?dl=0
# .5659 GB
tic()
dat_csv <- read_csv('data/marathon.csv')
toc()
# 12.621 sec elapsed

# https://www.dropbox.com/s/5h81st5lj0zf85w/marathon.sas7bdat?dl=0
# 1.18 GB
tic()
dat_sas <- read_sas('data/marathon.sas7bdat')
toc()
# 59.929 sec elapsed

# .163 GB
tic()
dat_feather <- arrow::open_dataset('arrow/feather', format= "arrow") %>%
    dplyr::collect()
toc()
# 1.849 sec elapsed

# .0276 Gb
tic()
dat_parquet <- arrow::open_dataset('arrow/parquet') %>%
    dplyr::collect()
toc()
# 1.733 sec elapsed

# Size in R
format(object.size(dat_parquet), units = "Gb", standard = "legacy")
# [1] "0.6 Gb"