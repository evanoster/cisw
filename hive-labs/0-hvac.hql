DROP TABLE IF EXISTS hvac;
 
--create the hvac table on comma-separated sensor data
CREATE EXTERNAL TABLE hvac(hvacdate STRING, time STRING, targettemp BIGINT,
    actualtemp BIGINT, 
    system BIGINT, 
    systemage BIGINT, 
    buildingid BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE LOCATION 
'wasb://mrs-spark@alizaidi.blob.core.windows.net/HdiSamples/HdiSamples/SensorSampleData/hvac/';
