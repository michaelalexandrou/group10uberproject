
CREATE DATABASE IF NOT EXISTS uber_fhv_data;
USE uber_fhv_data;


DROP TABLE IF EXISTS Trip;
CREATE TABLE Trip (
    TripID INT AUTO_INCREMENT PRIMARY KEY,
    PickupDateTime DATETIME,   
    Lat FLOAT,
    Lon FLOAT,
    Base VARCHAR(10)
);



DROP TABLE IF EXISTS FHV_Trip;
CREATE TABLE FHV_Trip (
    FHVTripID INT AUTO_INCREMENT PRIMARY KEY,
    time_of_trip DATETIME,
    start_lat FLOAT,
    start_lng FLOAT,
    UniqueTripRef VARCHAR(20) UNIQUE
);



DROP TABLE IF EXISTS Locations;

CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    Borough VARCHAR(500),
    Zone VARCHAR(1000)
);


DROP TABLE IF EXISTS company;

CREATE TABLE company (
    CompanyID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyName VARCHAR(100),
    UniqueTripRef VARCHAR(20) UNIQUE
);



DROP TABLE IF EXISTS UberMonthlyStats;
CREATE TABLE UberMonthlyStats (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Base VARCHAR(10),
    date DATE,
    active_vehicles INT,
    trips INT
);


# hardest part - Hardest part was glitches in VSCode, for some reason we couldn’t connect SQL through the extension, 
# so we had to use an earlier version of the VSCode extension MySQL. Dealing with that bug cost us a lot of time. 


# easiest part - I’m not usually that into data or databases, but I actually enjoyed this project. My favorite part was definitely 
# seeing how the data, the design, and the queries all came together in the end. It was cool to start with raw information and end up 
# with something organized and usable 