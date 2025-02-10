--Check Average Temperature per Sensor:

SELECT SENSOR_ID, AVG(TEMPERATURE_CELSIUS) AS AVG_TEMP 
FROM IOT_SENSOR_DATA 
GROUP BY SENSOR_ID;
Find Sensors Reporting High Temperatures:

--Find Sensors Reporting High Temperatures:
SELECT * FROM IOT_SENSOR_DATA WHERE TEMPERATURE_CELSIUS > 35;

--Find Maximum & Minimum Temperature per Sensor:
SELECT SENSOR_ID, 
       MAX(TEMPERATURE_CELSIUS) AS MAX_TEMP, 
       MIN(TEMPERATURE_CELSIUS) AS MIN_TEMP
FROM IOT_SENSOR_DATA
GROUP BY SENSOR_ID;

--Count Number of Records per Sensor:
SELECT SENSOR_ID, COUNT(*) AS TOTAL_READINGS
FROM IOT_SENSOR_DATA
GROUP BY SENSOR_ID
ORDER BY TOTAL_READINGS DESC;

--Find Sensors with Continuous High Temperatures
WITH HighTemp AS (
    SELECT SENSOR_ID, 
           TO_TIMESTAMP(TIMESTAMP) AS TIMESTAMP, 
           TEMPERATURE_CELSIUS,
           LAG(TEMPERATURE_CELSIUS) OVER (
               PARTITION BY SENSOR_ID 
               ORDER BY TO_TIMESTAMP(TIMESTAMP)
           ) AS PREV_TEMP,
           LEAD(TEMPERATURE_CELSIUS) OVER (
               PARTITION BY SENSOR_ID 
               ORDER BY TO_TIMESTAMP(TIMESTAMP)
           ) AS NEXT_TEMP
    FROM IOT_SENSOR_DATA
)
SELECT * FROM HighTemp
WHERE TEMPERATURE_CELSIUS > 35 
  AND PREV_TEMP > 35 
  AND NEXT_TEMP > 35;

--and play around with as many queries as you like