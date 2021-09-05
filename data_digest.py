# %%
import pandas as pd
import numpy as np
import pyarrow.parquet as pq
import pyarrow.feather as feather
import time
# %%
# 1.18 Gb
tic = time.perf_counter()
dat_csv = pd.read_sas('data/marathon.sas7bdat')
toc = time.perf_counter()
print(f"Parsed in {toc - tic:0.4f} seconds")
# Parsed in 63.4288 seconds

# %%
# # .0276 Gb
tic = time.perf_counter()
dat = pq.read_table('py_arrow/parquet')
dat_parquet = dat.to_pandas()
toc = time.perf_counter()
print(f"Parsed in {toc - tic:0.4f} seconds")
# Parsed in 1.1304 seconds
