# %%
import pandas as pd
import numpy as np
# %%
dat = pd.read_sas('data/marathon.sas7bdat')

# %%
# https://pythondata.com/working-large-csv-files-python/
chunksize = 250000 # how many rows to read/write at a time.
count = 0

for df in pd.read_sas(
        'data/marathon.sas7bdat', 
        chunksize=chunksize, 
        iterator=True):
    count += 1
    df.reset_index().to_feather('py_arrow/feather/file_{}.feather'.format(count))
    df.reset_index().to_parquet('py_arrow/parquet/file_{}.parquet'.format(count))
   