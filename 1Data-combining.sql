#DATA COMBINING

#Use created Database
USE `cyclistic-bike-sales-analysis`;

#Create new table in existing Databse
#combining all the 12 months data tables into a single table containing data from Jan 2023 to Dec 2023
#`tripdata_202301` is a created tables 
CREATE TABLE `cyclistic-bike-sales-analysis`.`combined_data` AS (
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202301`
UNION ALL
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202302`
UNION ALL
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202303`
UNION ALL
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202304`
UNION ALL
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202305`
UNION ALL
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202306`
UNION ALL
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202307`
UNION ALL
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202308`
UNION ALL
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202309`
UNION ALL
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202310`
UNION ALL
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202311`
UNION ALL
SELECT * FROM `cyclistic-bike-sales-analysis`.`tripdata_202312`
);

#Checking no of rows which are 128925
select count(*) from combined_data;
