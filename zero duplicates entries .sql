SELECT 
  COUNT(ride_id) AS total_logged_records,
  COUNT(DISTINCT ride_id) AS total_unique_ids,
  (COUNT(ride_id) - COUNT(DISTINCT ride_id)) AS duplicate_id_count
FROM 
  `kiima-case-study.cyclistic_data.clean_year_trips`