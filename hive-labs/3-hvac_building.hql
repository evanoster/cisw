
DROP TABLE IF EXISTS hvac_building;
 
--create the hvac_building table by joining the building table and the hvac_temperatures table
CREATE TABLE hvac_building AS 
SELECT h.*, b.country, b.hvacproduct, b.buildingage, b.buildingmgr
FROM building b JOIN hvac_temperatures h ON b.buildingid = h.buildingid;
