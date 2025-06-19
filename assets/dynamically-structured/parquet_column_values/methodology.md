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
```
query.max-memory = 1GB
task.max-worker-threads = 1
task.concurrency = 1
native-execution-enabled = true
```

### Worker (native execution) configuration
```
task.max-drivers-per-task=1
```

## Data Structure

Original data:
```
{
 "msg": {
   "ts": 0,
   "status": "ok"
 }
}

{
 "msg": {
   "ts": 1,
   "status": "error",
   "thread_num": 4,
   "backtrace": ""
 }
}
```

Compressed data structure:
| string_columns | string_values | int_columns | int_values |
|-|-|-|-|
| ["msg.status"] | ["ok"] | ["msg.ts"] | [0] |
| ["msg.status", "msg.backtrace"] | ["error", ""] | ["msg.ts", "msg.thread_num"] | [1, 4] |

### Searching

Get all error logs
```
SELECT * FROM table WHERE
array_position(string_columns, 'msg.status') > 0 
AND element_at(
  string_values, 
  array_position(string_columns, 'msg.status')
) = 'error';
```


[presto]: https://github.com/y-scope/presto/tree/ec3aedb239508ccd91891260ae89e111eb268761
