CREATE TABLE `kiima-case-study.cyclistic_data.combined_data` AS

SELECT * FROM `kiima-case-study.cyclistic_data.202511_trips` UNION ALL
SELECT * FROM `kiima-case-study.cyclistic_data.202512_trips` UNION ALL
SELECT * FROM `kiima-case-study.cyclistic_data.202601_trips` UNION ALL
SELECT * FROM `kiima-case-study.cyclistic_data.202602_trips` UNION ALL
SELECT * FROM `kiima-case-study.cyclistic_data.202603_trips` UNION ALL
SELECT * FROM `kiima-case-study.cyclistic_data.202604_trips` UNION ALL
SELECT * FROM `kiima-case-study.cyclistic_data.202605_trips` UNION ALL
SELECT * FROM `kiima-case-study.cyclistic_data.202606_trips` UNION ALL
SELECT * FROM `kiima-case-study.cyclistic_data.202607_trips` UNION ALL
SELECT * FROM `kiima-case-study.cyclistic_data.202608_trips` UNION ALL
SELECT * FROM `kiima-case-study.cyclistic_data.202609_trips` 



