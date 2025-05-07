# this is to select from tables
SELECT * FROM trip LIMIT 100;
SELECT * FROM fhv_trip LIMIT 100;
SELECT * FROM locations LIMIT 100;
SELECT * FROM company LIMIT 100;
SELECT * FROM ubermonthlystats LIMIT 100;


# join to show time of trip and company name of rides
SELECT 
    f.FHVTripID,
    f.time_of_trip,
    f.UniqueTripRef,
    c.CompanyName
FROM fhv_trip f
JOIN company c ON f.UniqueTripRef = c.UniqueTripRef
LIMIT 100;

#aggregate function to show total trip count and average geographic locations dependent on base
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


#view - The FHV_TripDetails view gives a  summary of rides from the fhv_trip table, matched with the company that 
# provided each ride using a unique trip ID. It shows when the trip happened and where it started (latitude and longitude), 
# and which company handled it. This view shows all of the important trip details in one place, without needing to 
# run a complicated join every time.
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

#createrole - We created a role called group10, then we created two users and granted them only SELECT access to 
# prevent accidental changes. This is just to make sure our data can be read safely but not edited or deleted or altered in some way.”


CREATE ROLE group10;
GRANT SELECT ON uber_fhv_data.* TO group10;

CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password1';
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'password2';

GRANT group10 TO 'user1'@'localhost';
GRANT group10 TO 'user2'@'localhost';



# hardest part - Hardest part was glitches in VSCode, for some reason we couldn’t connect SQL through the extension, 
# so we had to use an earlier version of the VSCode extension MySQL. Dealing with that bug cost us a lot of time. 


# easiest part - I’m not usually that into data or databases, but I actually enjoyed this project. My favorite part was definitely 
# seeing how the data, the design, and the queries all came together in the end. It was cool to start with raw information and end up 
# with something organized and usable 