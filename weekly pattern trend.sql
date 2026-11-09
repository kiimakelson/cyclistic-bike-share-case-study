--Trend A: Weekday Demand Patterns (By Day of Week)
CREATE TABLE `kiima-case-study.cyclistic_data.weekly_trends` AS
SELECT 
  member_casual,
  day_of_week, -- 1 = Sunday, 7 = Saturday
  COUNT(ride_id) AS total_trips,
  ROUND(AVG(ride_length), 2) AS average_ride_length
FROM 
  `kiima-case-study.cyclistic_data.clean_year_trips`
GROUP BY 
  member_casual, day_of_week
ORDER BY 
  member_casual, day_of_week;
