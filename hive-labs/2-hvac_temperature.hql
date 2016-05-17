DROP TABLE IF EXISTS hvac_temperatures;
 
--create the hvac_temperatures table by selecting from the hvac table
CREATE TABLE hvac_temperatures AS
SELECT *, targettemp - actualtemp AS temp_diff, 
    IF((targettemp - actualtemp) > 5, 'COLD', 
    IF((targettemp - actualtemp) < -5, 'HOT', 'NORMAL')) AS temprange, 
    IF((targettemp - actualtemp) > 5, '1', IF((targettemp - actualtemp) < -5, '1', 0)) AS extremetemp
FROM hvac;
