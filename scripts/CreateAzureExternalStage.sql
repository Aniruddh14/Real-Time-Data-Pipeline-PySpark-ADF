--Create an External Stage in Snowflake
CREATE OR REPLACE STAGE azure_stage
URL = 'azure://aniruddhdatalake.blob.core.windows.net/iot-processed'
STORAGE_INTEGRATION = azure_integration
FILE_FORMAT = (TYPE = PARQUET);

--Configure Azure Storage Integration in Snowflake
CREATE OR REPLACE STORAGE INTEGRATION azure_integration
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = 'AZURE'
ENABLED = TRUE
AZURE_TENANT_ID = '54925a00-9b13-4b0a-9222-2ff5a216606b'
STORAGE_ALLOWED_LOCATIONS = ('azure://aniruddhdatalake.blob.core.windows.net/iot-processed/');

--Get the Snowflake Storage Integration's Role ARN
DESC STORAGE INTEGRATION azure_integration;

--**Go to Azure and Assign Permissions:

--In Azure Storage Account > Access Control (IAM), 
--assign the Storage Blob Data Reader role to the 
--Snowflake-generated Role ARN.