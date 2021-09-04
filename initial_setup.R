# https://uchicago.app.box.com/s/m6zvhtudswz8mctu1kcxr3a4a33f24qc
# https://www.dropbox.com/s/pck9qnwmbo4vjsi/marathon.csv?dl=0
library(tidyverse)
library(feather)
library(tictoc)
library(haven)

# A little formatting for the example
dat <- read_csv("data/master_marathon.csv")

dat %>%
    select(age, gender, chiptime, year,
        marathon, country, finishers, meantime) %>%
    write_csv("data/marathon.csv")

dat %>%
    select(age, gender, chiptime, year,
        marathon, country, finishers, meantime) %>%
    write_sas("data/marathon.sas7bdat")

# Now the example
# https://www.dropbox.com/s/pck9qnwmbo4vjsi/marathon.csv?dl=0
tic()
dat <- read_csv('data/marathon.csv')
toc()
# 9.231 sec elapsed


