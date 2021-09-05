library(dplyr)
library(arrow)

# notice that dpq is a FileSystemDataset
(dpq <- open_dataset("arrow/parquet"))
(dtib <- dpq %>% collect())

# https://arrow.apache.org/docs/r/articles/dataset.html

# now we can apply dplyr methods against the parquet files 
dpq %>%
 mutate(
     age_days = age * 365.25,
     age_minutes = age_days * 24*60,
     chiptime_seconds = chiptime * 60
 ) %>% 
 select(age_days, age_minutes, chiptime_seconds) %>%
 collect()


# groupby doesn't work on parquet files
# have to convert to tibble.
dpq %>%
 filter(age == 34, chiptime < 166) %>%
 select(
     gender, marathon, finishers, 
     chiptime, year) %>%
 group_by(marathon, gender) %>%
 collect() %>% # notice collect()
 summarise(
     mean_time = mean(chiptime),
     min_year = min(year),
     max_year = max(year),
     min_finishers = min(finishers),
     max_finishers = max(finishers)
 )

# we can save our data by `marathon` to facilitate quicker filters and modeling.

dpq %>%
    group_by(marathon) %>%
    write_dataset('arrow/parquet_grouped')
