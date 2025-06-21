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

parquetFile = spark.read.parquet("/data/mongod")
parquetFile.createOrReplaceTempView("parquetFile")

results = spark.sql(f"SELECT * FROM parquetFile WHERE {sys.argv[1]};")
print(results.count())
