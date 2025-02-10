# Real-Time-Data-Pipeline-PySpark-ADF

# Real-Time Data Processing Pipeline with PySpark & ADF

## Overview
This project demonstrates a real-time data pipeline using **Azure Data Factory, PySpark, and Snowflake**. 

## Tech Stack
- **Azure Data Factory**: Data orchestration
- **Azure Databricks (PySpark)**: Data transformation
- **Azure Data Lake**: Storage
- **Snowflake**: Data warehouse
- **Python**: Simulating IoT sensor data

## Steps
1. Simulated IoT sensor data is ingested into Azure Blob Storage.
2. ADF moves the data to Azure Data Lake.
3. PySpark processes the data in Azure Databricks.
4. Transformed data is stored in Snowflake.
5. Queries & dashboards analyze the data.

## How to Run
- Run `scripts/Simulate_IOT_DATA.py` to generate mock IoT data.
- Deploy the ADF pipeline using `pipelines/adf_pipeline.json`.
- Run PySpark processing via `notebooks/Azure-databricks-iot-data-process.py`.
- Run snowflake queries in the following order :
1. `scripts/CreateAzureExternalStage.sql`.
2. `scripts/CreateSnowflakeTable.sql`.
3. `scripts/CopyDataAzure2Snowflake.sql`.
4. `scripts/SnowflakeQueriesToAnalyzeData.sql`.

# Change the AZURE STORAGE ACCOUNT name, CONTAINER name, CONNECTION strings in code based on your own Azure account.