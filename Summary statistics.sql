CREATE OR REPLACE TABLE `kiima-case-study.cyclistic_data.summary_statistics` AS
SELECT 
  member_casual,
  -- 1. Total volume of trips
  COUNT(ride_id) AS total_trips,
  
 -- 2. Average ride length in minutes (converts TIME to an INTERVAL, gets average, extracts fractional minutes)
  ROUND(
    EXTRACT(MICROSECOND FROM AVG(ride_length - TIME '00:00:00')) / 60000000 + 
    EXTRACT(SECOND FROM AVG(ride_length - TIME '00:00:00')) / 60 + 
    EXTRACT(MINUTE FROM AVG(ride_length - TIME '00:00:00')) + 
    EXTRACT(HOUR FROM AVG(ride_length - TIME '00:00:00')) * 60, 
    2
  ) AS average_ride_length_minutes,

  -- 3. Minimum and Maximum thresholds
  MIN(ride_length) AS min_ride_length,
  MAX(ride_length) AS max_ride_length,
  
  -- 4. Most frequently used bike type
  APPROX_TOP_COUNT(rideable_type, 1)[OFFSET(0)].value AS preferred_bike_type
FROM 
  `kiima-case-study.cyclistic_data.clean_year_trips`
GROUP BY 
  member_casual;

-- View the results instantly
SELECT * FROM `kiima-case-study.cyclistic_data.summary_statistics`
