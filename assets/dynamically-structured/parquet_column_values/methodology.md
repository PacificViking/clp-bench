# Parquet (PyArrow+Presto+Hive) methodology

## Basics

pyarrow 20.0.0
Presto Version: [presto-server-0.293-SNAPSHOT][presto]

## Setup

Ingested every json log into single varchar column, and parsed them during search
This ingestion was done solely with PyArrow generating a parquet file

### Coordinator configuration
query.max-memory = 1GB
task.max-worker-threads = 1
task.concurrency = 1
native-execution-enabled = true

### Worker (native execution) configuration

[presto]: https://github.com/y-scope/presto/tree/ec3aedb239508ccd91891260ae89e111eb268761
