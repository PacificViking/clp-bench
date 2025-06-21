import sys

from pyspark.sql import SparkSession

spark = SparkSession \
    .builder \
    .appName("") \
    .master("local[1]") \
    .config("spark.sql.caseSensitive", True) \
    .config("spark.cores.max", "1") \
    .config("spark.executor.cores", "1") \
    .config("spark.executor.instances", "1") \
    .getOrCreate()

df = spark.read.json(sys.argv[1])
df.write.parquet("/data/mongod", mode="overwrite", compression="zstd")  # need to set zstd(3)
