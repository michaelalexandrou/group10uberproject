# select from tables
SELECT * FROM trip LIMIT 100;
SELECT * FROM fhv_trip LIMIT 100;
SELECT * FROM locations LIMIT 100;
SELECT * FROM company LIMIT 100;
SELECT * FROM ubermonthlystats LIMIT 100;


# join to show timeoftrip and company name of rides
SELECT 
    f.FHVTripID,
    f.time_of_trip,
    f.UniqueTripRef,
    c.CompanyName
FROM fhv_trip f
JOIN company c ON f.UniqueTripRef = c.UniqueTripRef
LIMIT 100;

#shows total trip count and average geographic locations dependent on base
#base refers to 'dispatching base identifier' which is where the driving company car is located within the city
SELECT 
    Base,
    COUNT(*) AS trip_count,
    ROUND(AVG(Lat), 4) AS avg_latitude,
    ROUND(AVG(Lon), 4) AS avg_longitude
FROM trip
GROUP BY Base
ORDER BY trip_count DESC
LIMIT 10;


#view
CREATE OR REPLACE VIEW FHV_TripDetails AS
SELECT 
    f.FHVTripID,
    f.time_of_trip,
    c.CompanyName,
    f.start_lat,
    f.start_lng
FROM fhv_trip f
JOIN company c ON f.UniqueTripRef = c.UniqueTripRef;

SELECT * FROM FHV_TripDetails LIMIT 100;

#createrole
CREATE ROLE group10;
GRANT SELECT ON uber_fhv_data.* TO group10;

CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password1';
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'password2';

GRANT group10 TO 'user1'@'localhost';
GRANT group10 TO 'user2'@'localhost';



