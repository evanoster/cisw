DROP TABLE IF EXISTS building;
--create the building table on comma-separated building data
CREATE EXTERNAL TABLE building(buildingid BIGINT, buildingmgr STRING, 
    buildingage BIGINT, 
    hvacproduct STRING,
    country STRING) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE LOCATION 'wasb://bwoodyhdi@bwoodysa.blob.core.windows.net/HdiSamples/SensorSampleData/building/';
