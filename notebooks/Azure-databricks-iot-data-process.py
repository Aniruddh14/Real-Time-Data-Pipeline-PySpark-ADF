from pyspark.sql import SparkSession
from pyspark.sql.functions import col, from_json
from pyspark.sql.types import StructType, StringType, FloatType, IntegerType

# Create a Spark session
spark = SparkSession.builder.appName("IoTDataProcessing").getOrCreate()

# Define Schema
schema = StructType() \
    .add("timestamp", StringType()) \
    .add("sensor_id", IntegerType()) \
    .add("temperature", FloatType()) \
    .add("humidity", FloatType()) \
    .add("pressure", FloatType())

# Read Parquet files from Azure Data Lake
df = spark.read.schema(schema).parquet("abfss://iot-data-parq@aniruddhdatalake.dfs.core.windows.net/iot-data-parq/")

# Data Transformation
df = df.withColumn("temperature_celsius", col("temperature")) \
       .withColumn("temperature_fahrenheit", col("temperature") * 9/5 + 32) \
       .withColumn("humidity_percentage", col("humidity") / 100)

df.show()

df.write.mode("overwrite").parquet("abfss://iot-data-databricks@aniruddhdatalake.dfs.core.windows.net/iot-processed/")
