--Trend B: Hourly Peak Demand (By Hour of Day)

CREATE OR REPLACE TABLE cyclistic_data.hourly_trends AS
SELECT 
  member_casual,
  EXTRACT(HOUR FROM started_at) AS hour_of_day,
  COUNT(ride_id) AS total_trips
FROM 
  `kiima-case-study.cyclistic_data.clean_year_trips`
GROUP BY 
  member_casual, hour_of_day
ORDER BY 
  member_casual, hour_of_day;

