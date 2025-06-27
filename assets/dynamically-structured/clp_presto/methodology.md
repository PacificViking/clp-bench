# Presto + clp methodology

## Basics

Presto Version: [presto-server-0.293-SNAPSHOT][presto]
Velox Version: [Velox][velox]

## Setup

* Renamed all keys within dataset that contained a ' ' or a '-' by encoding with base64

* Launched clp-json with sbin/start-clp.sh outside of container

* Ingested using clp-json/sbin/compress outside of container
``` bash
sbin/compress.sh --timestamp-key 't.\$date' ~/clp-bench/mongodb/mongod.log
```

* assets/ingest.sh must still be called to correct metadata in sql

* Searching is done normally with the `clp-bench` command

### Coordinator configuration
```
task.max-worker-threads = 1
task.concurrency = 1
native-execution-enabled = true
```

### Worker (native execution) configuration
```
task.max-drivers-per-task=1
```

[presto]: https://github.com/anlowee/presto/tree/faae543ae318f0289f5d0b537c5724e1b085a2fc
[velox]: https://github.com/anlowee/velox/tree/5a55969d5fd21bb4bcb53645b832344ff6bbd634
