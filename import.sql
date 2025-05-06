
USE uber_fhv_data;

#  trip table import

LOAD DATA LOCAL INFILE 'C:/Users/Michael/Downloads/uber-raw-data-apr14.csv'
INTO TABLE Trip
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@raw_date, Lat, Lon, Base)
SET PickupDateTime = STR_TO_DATE(@raw_date, '%c/%e/%Y %H:%i:%s');

LOAD DATA LOCAL INFILE 'C:/Users/Michael/Downloads/uber-raw-data-may14.csv'
INTO TABLE Trip
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@raw_date, Lat, Lon, Base)
SET PickupDateTime = STR_TO_DATE(@raw_date, '%c/%e/%Y %H:%i:%s');

LOAD DATA LOCAL INFILE 'C:/Users/Michael/Downloads/uber-raw-data-jun14.csv'
INTO TABLE Trip
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@raw_date, Lat, Lon, Base)
SET PickupDateTime = STR_TO_DATE(@raw_date, '%c/%e/%Y %H:%i:%s');

LOAD DATA LOCAL INFILE 'C:/Users/Michael/Downloads/uber-raw-data-jul14.csv'
INTO TABLE Trip
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@raw_date, Lat, Lon, Base)
SET PickupDateTime = STR_TO_DATE(@raw_date, '%c/%e/%Y %H:%i:%s');

LOAD DATA LOCAL INFILE 'C:/Users/Michael/Downloads/uber-raw-data-aug14.csv'
INTO TABLE Trip
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@raw_date, Lat, Lon, Base)
SET PickupDateTime = STR_TO_DATE(@raw_date, '%c/%e/%Y %H:%i:%s');

LOAD DATA LOCAL INFILE 'C:/Users/Michael/Downloads/uber-raw-data-sep14.csv'
INTO TABLE Trip
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@raw_date, Lat, Lon, Base)
SET PickupDateTime = STR_TO_DATE(@raw_date, '%c/%e/%Y %H:%i:%s');

#fhv trip table
LOAD DATA LOCAL INFILE 'C:/Users/Michael/Downloads/Lyft_B02510.csv'
INTO TABLE FHV_Trip
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@raw_time, start_lat, start_lng, @unused, UniqueTripRef)
SET time_of_trip = STR_TO_DATE(@raw_time, '%c/%e/%Y %H:%i:%s');
;

# location table
LOAD DATA LOCAL INFILE 'C:/Users/Michael/Downloads/taxi-zone-lookup.csv'
INTO TABLE locations
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationID, Borough, Zone);




#companies table
LOAD DATA LOCAL INFILE 'C:/Users/Michael/Downloads/company.csv'
INTO TABLE company
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CompanyName, UniqueTripRef);


#uber monthly stats
LOAD DATA LOCAL INFILE 'C:/Users/Michael/Downloads/Uber-Jan-Feb-FOIL.csv'
INTO TABLE UberMonthlyStats
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Base, date, active_vehicles, trips);
