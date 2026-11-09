SELECT 
  -- 1. Verifies your exact temporal date boundaries
  MIN(started_at) AS earliest_trip_timestamp,
  MAX(started_at) AS latest_trip_timestamp,
  
  -- 2. Verifies structural duration limits (Should be bounded tightly between 1 and 1440)
  MIN(ride_length) AS minimum_calculated_duration,
  MAX(ride_length) AS maximum_calculated_duration,
  
  -- 3. Verifies that categorical classification parameters are strictly standardized
  
FROM (
  SELECT *, 
         (SELECT STRING_AGG(DISTINCT member_casual, ', ') FROM `kiima-case-study.cyclistic_data.clean_year_trips`) AS DISTINCT_MEMBER_TYPES
  FROM `kiima-case-study.cyclistic_data.clean_year_trips`
)
LIMIT 1;