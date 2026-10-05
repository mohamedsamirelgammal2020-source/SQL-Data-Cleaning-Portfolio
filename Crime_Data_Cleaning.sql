USE messy_data;

SELECT *
FROM crime_incidents_messy;
UPDATE crime_incidents_messy
SET property_loss_usd = NULL
WHERE property_loss_usd = 'N/A';
update crime_incidents_messy
set crime_type = trim (crime_type);

update crime_incidents_messy
set district = trim (district);
UPDATE CRIME_INCIDENTS_MESSY
 SET OFFICER_FIRST_NAME = TRIM(OFFICER_FIRST_NAME);
select DISTINCT crime_type
from crime_incidents_messy
where length(crime_type) = 2 OR length(crime_type) = 3;

update crime_incidents_messy
set crime_type = 'Sexual Assault'
where crime_type = 'SA';
update crime_incidents_messy
set crime_type = 'Driving While Intoxicated'
where crime_type = 'DWI';
update crime_incidents_messy
set crime_type = 'Driving Under the Influence'
where crime_type = 'DUI' OR crime_type = 'D.U.I.';
update crime_incidents_messy
set crime_type = 'Domestic Violence'
where crime_type = 'DV';
update crime_incidents_messy
set crime_type = 'Breaking and Entering'
where crime_type = 'B&E';

select DISTINCT district
from crime_incidents_messy
where length(district) = 3;
 UPDATE crime_incidents_messy
SET district = 'North'
WHERE district = 'Nor';
 UPDATE crime_incidents_messy
SET district = 'South'
WHERE district = 'Sou';
 UPDATE crime_incidents_messy 
SET district = 'Central'
WHERE district = 'Cen';
UPDATE crime_incidents_messy
SET district = 'East'
WHERE district = 'Eas';
UPDATE crime_incidents_messy
SET district = 'West'
WHERE district = 'Wes';
UPDATE crime_incidents_messy
SET district = 'Midtown'
WHERE district = 'Mid';
UPDATE crime_incidents_messy
SET district = CONCAT(UPPER(SUBSTRING(district, 1, 1)), LOWER(SUBSTRING(district, 2)));
UPDATE crime_incidents_messy
SET CRIME_TYPE = CONCAT(UPPER(SUBSTRING(CRIME_TYPE, 1, 1)), LOWER(SUBSTRING(CRIME_TYPE, 2)));
UPDATE crime_incidents_messy
SET WEAPON_USED = CONCAT(UPPER(SUBSTRING(WEAPON_USED, 1, 1)), LOWER(SUBSTRING(WEAPON_USED, 2)));
UPDATE crime_incidents_messy
SET resolution = CONCAT(UPPER(SUBSTRING(resolution, 1, 1)), LOWER(SUBSTRING(resolution, 2)));
UPDATE crime_incidents_messy
SET suspect_gender = CONCAT(UPPER(SUBSTRING(suspect_gender, 1, 1)), LOWER(SUBSTRING(suspect_gender, 2)));
UPDATE crime_incidents_messy
SET victim_gender = CONCAT(UPPER(SUBSTRING(victim_gender, 1, 1)), LOWER(SUBSTRING(victim_gender, 2)));
UPDATE crime_incidents_messy
SET severity = CONCAT(UPPER(SUBSTRING(severity, 1, 1)), LOWER(SUBSTRING(severity, 2)));
UPDATE crime_incidents_messy
SET suspect_race = CONCAT(UPPER(SUBSTRING(suspect_race, 1, 1)), LOWER(SUBSTRING(suspect_race, 2)));
UPDATE crime_incidents_messy
SET case_status = CONCAT(UPPER(SUBSTRING(case_status, 1, 1)), LOWER(SUBSTRING(case_status, 2)));
UPDATE crime_incidents_messy
SET reported_online = CONCAT(UPPER(SUBSTRING(reported_online, 1, 1)), LOWER(SUBSTRING(reported_online, 2)));
UPDATE crime_incidents_messy
SET incident_datetime = NULL
WHERE incident_datetime = 'N/A' OR incident_datetime = '';

UPDATE crime_incidents_messy
SET 
    suspect_gender = CASE WHEN suspect_gender IN ('N/A', '') THEN NULL ELSE suspect_gender END,
    suspect_race = CASE WHEN suspect_race IN ('N/A', '') THEN NULL ELSE suspect_race END,
    victim_gender = CASE WHEN victim_gender IN ('N/A', '') THEN NULL ELSE victim_gender END,
    victim_phone = CASE WHEN victim_phone IN ('N/A', '') THEN NULL ELSE victim_phone END,
    weapon_used = CASE WHEN weapon_used IN ('N/A', '') THEN NULL ELSE weapon_used END,
    severity = CASE WHEN severity IN ('N/A', '') THEN NULL ELSE severity END,
    case_status = CASE WHEN case_status IN ('N/A', '') THEN NULL ELSE case_status END;
UPDATE crime_incidents_messy
SET victim_gender = 'Female'
WHERE victim_gender = 'F';

UPDATE crime_incidents_messy
SET victim_gender = 'Male'
WHERE victim_gender = 'M';ALTER TABLE crime_incidents_messy
MODIFY COLUMN num_arrests INT;
UPDATE crime_incidents_messy
SET num_arrests = ABS(num_arrests)
WHERE num_arrests < 0;

UPDATE crime_incidents_messy
SET severity = CASE 
    WHEN severity = '1' THEN 'Low'
    WHEN severity = '2' OR severity = 'Med' THEN 'Medium'
    WHEN severity = '3' THEN 'High'
    WHEN severity = '4' OR severity = 'Crit' THEN 'Critical'
    ELSE severity 
END;
UPDATE crime_incidents_messy
SET property_loss_usd = ABS(property_loss_usd)
WHERE property_loss_usd < 0;
UPDATE crime_incidents_messy
SET severity = TRIM(severity);

UPDATE crime_incidents_messy
SET reported_online = TRIM(reported_online);
-- الخطوة الثانية: توحيد البيانات (التلميع)
UPDATE crime_incidents_messy
SET reported_online = CASE 
    WHEN reported_online = '1' OR reported_online = 'yes' OR reported_online = 'True' THEN 'Yes'
    WHEN reported_online = '0' OR reported_online = 'no' OR reported_online = 'False' THEN 'No'
    ELSE reported_online
END;
UPDATE crime_incidents_messy
SET victim_age = NULL
WHERE victim_age < 0 OR victim_age > 100;
UPDATE crime_incidents_messy
SET suspect_age = NULL
WHERE suspect_age < 0 OR suspect_age > 100;

UPDATE crime_incidents_messy
SET victim_age = NULL
WHERE victim_age > 100;

UPDATE crime_incidents_messy
SET victim_age = ABS(victim_age)
WHERE victim_age < 0;
UPDATE crime_incidents_messy
SET suspect_age = NULL
WHERE suspect_age > 100;

UPDATE crime_incidents_messy
SET suspect_age = ABS(suspect_age)
WHERE suspect_age < 0;
SELECT latitude, longitude 
FROM crime_incidents_messy
WHERE (latitude < -90 OR latitude > 90) 
   OR (longitude < -180 OR longitude > 180) 
   OR (longitude > 0);
   UPDATE crime_incidents_messy
SET longitude = -longitude
WHERE longitude > 0;
UPDATE crime_incidents_messy
SET latitude = NULL
WHERE latitude > 90 OR latitude < -90;
SELECT latitude, longitude 
FROM crime_incidents_messy
WHERE (latitude < -90 OR latitude > 90) -- أخطاء خط العرض
   OR (longitude < -180 OR longitude > 180) -- أخطاء خط الطول
   OR (longitude > 0); 

UPDATE crime_incidents_messy
SET suspect_gender = 'Male'
WHERE suspect_gender = 'M'

UPDATE crime_incidents_messy
SET suspect_gender = 'Female'
WHERE suspect_gender = 'F'

UPDATE crime_incidents_messy
SET incident_datetime = 'Missing'
WHERE incident_datetime IS NULL;

select *
from crime_incidents_messy