#DATA EXPLORATION

#Use created Database
USE `cyclistic-bike-sales-analysis`;

#checking the data types of all columns
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'cyclistic-bike-sales-analysis' AND table_name = 'combined_data';

#checking for number of null values in all columns
SELECT
	COUNT(*) - COUNT(ride_id) AS ride_id,
    COUNT(*) - COUNT(rideable_type) AS rideable_type,
    COUNT(*) - COUNT(started_at) AS started_at,
    COUNT(*) - COUNT(ended_at) AS ended_at,
    COUNT(*) - COUNT(start_station_name) AS start_station_name,
    COUNT(*) - COUNT(start_station_id) AS start_station_id,
    COUNT(*) - COUNT(end_station_name) AS end_station_name,
    COUNT(*) - COUNT(end_station_id) AS end_station_id,
    COUNT(*) - COUNT(start_lat) AS start_lat,
    COUNT(*) - COUNT(start_lng) AS start_lng,
    COUNT(*) - COUNT(end_lat) AS end_lat,
    COUNT(*) - COUNT(end_lng) AS end_lng,
    COUNT(*) - COUNT(member_casual) AS member_casual
FROM combined_data;

#checking for duplicate values
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM combined_data;

#Checking (ride_id) length, count of id and grouping by length of id
SELECT LENGTH(ride_id) AS ride_id_length, COUNT(ride_id) AS no_of_rows 
FROM combined_data
GROUP BY ride_id_length;

#checking types of bikes in (rideable_type)
SELECT DISTINCT(rideable_type) AS type_of_bikes, COUNT(rideable_type) AS no_of_trips
FROM combined_data
GROUP BY type_of_bikes;

#started_at, ended_at - TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC
SELECT started_at, ended_at
FROM combined_data
LIMIT 10;

SELECT COUNT(*) AS day_longer
FROM combined_data
WHERE (
	EXTRACT(HOUR FROM(ended_at - started_at)) * 60 +
    EXTRACT(MINUTE FROM(ended_at - started_at)) +
    EXTRACT(SECOND FROM(ended_at - started_at))/60
    ) >= 1440;   #day_longer - total rows = 0
    
SELECT COUNT(*) AS less_than_minute
FROM combined_data
WHERE (
	EXTRACT(HOUR FROM(ended_at - started_at)) * 60 +
    EXTRACT(MINUTE FROM(ended_at - started_at)) +
    EXTRACT(SECOND FROM(ended_at - started_at))/60
    ) <= 1;      #less_than_minute - totalrows = 128925
    
#Checking null values and counting start_station_name, start_station_id
SELECT COUNT(DISTINCT start_station_name) as count_station_names
FROM combined_data;

SELECT COUNT(DISTINCT start_station_id) as count_station_ids
FROM combined_data;

SELECT DISTINCT(start_station_name)
FROM combined_data
ORDER BY start_station_name;

SELECT DISTINCT(start_station_id)
FROM combined_data
ORDER BY start_station_id;

SELECT COUNT(ride_id) AS rows_with_null
FROM combined_data
WHERE (start_station_name IS NULL OR start_station_name = '') OR (start_station_id IS NULL OR start_station_name = '');

#Checking null values and counting end_station_name, end_station_id
SELECT COUNT(DISTINCT end_station_name) as count_endstation_names
FROM combined_data;

SELECT COUNT(DISTINCT end_station_id) as count_endstation_ids
FROM combined_data;

SELECT DISTINCT(end_station_name)
FROM combined_data
ORDER BY end_station_name;

SELECT DISTINCT(end_station_id)
FROM combined_data
ORDER BY end_station_id;

SELECT COUNT(ride_id) AS rows_with_null
FROM combined_data
WHERE (end_station_name IS NULL OR end_station_name = '') OR (end_station_id IS NULL OR end_station_id = '');

#checking null values of end_lat, end_lng
SELECT COUNT(ride_id) AS rows_with_null 
FROM combined_data
WHERE (end_lat IS NULL OR end_lat = '') OR (end_lng IS NULL OR end_lng = '');

#Checking and counting member and casual riders
SELECT DISTINCT(member_casual), COUNT(member_casual) AS no_of_trips
FROM combined_data
GROUP BY member_casual;

