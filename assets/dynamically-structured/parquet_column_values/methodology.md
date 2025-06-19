# Parquet (PyArrow+Presto+Hive) methodology

## Basics

pyarrow 20.0.0
Presto Version: [presto-server-0.293-SNAPSHOT][presto]

## Setup

* Parsed every JSON log recusively into array columns <variable type>_columns and
<variable type>_values
* Dot syntax used for child objects
* zstd(3) compression used
* This ingestion was done solely with PyArrow generating a parquet file

### Coordinator configuration
query.max-memory = 1GB
task.max-worker-threads = 1
task.concurrency = 1
native-execution-enabled = true

### Worker (native execution) configuration
task.max-drivers-per-task=1

[presto]: https://github.com/y-scope/presto/tree/ec3aedb239508ccd91891260ae89e111eb268761
