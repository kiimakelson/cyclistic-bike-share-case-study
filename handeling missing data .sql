SELECT 
  COUNTIF(start_station_name IS NULL) AS missing_start_station_names,
  COUNTIF(end_station_name IS NULL) AS missing_end_station_names,
  COUNTIF(start_station_id IS NULL) AS missing_start_station_ids,
  COUNTIF(end_station_id IS NULL) AS missing_end_station_ids
FROM 
  `kiima-case-study.cyclistic_data.clean_year_trips`