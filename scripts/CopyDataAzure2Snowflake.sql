--Steps to create azure stage in CreateAzureExternalStageSnowflake.sql

COPY INTO IOT_SENSOR_DATA 
FROM @azure_stage
FILE_FORMAT = (TYPE = PARQUET);
