CREATE TABLE `kiima-case-study.cyclistic_data.clean_year_trips` AS 
SELECT * FROM `kiima-case-study.cyclistic_data.combined_year_trips` WHERE
ride_length >= '00:01:00'
AND ride_length <='23:59:59' 
AND start_station_name IS NOT NULL
AND end_station_name IS NOT NULL