# Cyclistic Bike-Share GitHub Analytics: Google Data Analytics Capstone Project

![SQL](https://shields.io)
![Visualization](https://shields.io)
![Data_Size](https://shields.io)

## 📌 Project Overview
This repository contains a comprehensive data analytics case study evaluating historical trip transaction logs from *Cyclistic, a fictional bike-share system operating in Chicago. Following the data analysis lifecycle (Ask, Prepare, Process, Analyze, Share, Act*), this project uncovers how casual riders and annual members utilize the network differently to drive data-backed membership conversion strategies.

---

## 📂 1. Ask Phase
*   *Core Business Objective:* Maximize annual memberships by converting casual riders.
*   *Key Question:* How do annual members and casual riders use Cyclistic bikes differently?
*   *Stakeholders:* Lily Moreno (Director of Marketing), Cyclistic Executive Team.

---

## 🗄️ 2. Prepare Phase
*   *Data Source:* 12 months of historical Cyclistic trip data (October 2025 – September 2026) retrieved from the public [Divvy Trip Data Index](https://amazonaws.com).
*   *Data Credibility (ROCCC):* *Reliable (system logs), **Original (Motivate International Inc.), **Comprehensive (all city network trips), **Current (monthly updates), and **C*ited.
*   *Privacy & Security:* Anonymized transactional data with *zero Personally Identifiable Information (PII)*; pass purchases cannot be traced back to credit cards.

---

## 🛠️ 3. Process Phase
Due to the large dataset size exceeding 5 million rows, *Google BigQuery (SQL)* was utilized for data consolidation, structural alignment, and data scrubbing.

<details>
<summary><b>🔹 Click to View SQL: Schema Consolidation & Type Casting</b></summary>

sql
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

-- [Repeat UNION ALL blocks cleanly for all remaining months through 202609_trips]
;

</details>

<details>
<summary><b>🔹 Click to View SQL: Column Engineering & Data Filtering</b></summary>

sql
CREATE TABLE `kiima-case-study.cyclistic_data.clean_year_trips` AS
SELECT 
  *,
  DATETIME_DIFF(ended_at, started_at, MINUTE) AS ride_length,
  EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week,
  EXTRACT(MONTH FROM started_at) AS month
FROM 
  `kiima-case-study.cyclistic_data.combined_data`
WHERE 
  DATETIME_DIFF(ended_at, started_at, MINUTE) >= 1        -- Filter out false starts (< 1 min)
  AND DATETIME_DIFF(ended_at, started_at, MINUTE) <= 1440  -- Filter out unreturned trips (> 24 hrs)
  AND start_station_name IS NOT NULL                        -- Clean empty tracking grids
  AND end_station_name IS NOT NULL;

</details>

---

## 📊 4. Analyze & Share Phase
Aggregated metrics reveal a distinct divergence between commuter utility and recreational leisure behaviors.

### Summary Metrics

| User Type | Total Trips | Avg Trip Duration | Preferred Hardware |
| :--- | :--- | :--- | :--- |
| *Annual Member* | 2,653,170 | 12.41 minutes | Electric Bike |
| *Casual Rider* | 1,396,637 | 20.31 minutes | Electric Bike |

### Key Findings
1.  *The Weekly Crossover:* Annual member traffic remains consistently high Monday through Friday, peaking on Wednesdays (*430,776 trips). Casual traffic rises steeply toward the weekend, peaking on Saturdays (292,105 trips*).
2.  *The Hourly Pulse:* Members display a sharp *"M-shaped" commuter double-peak* at 8:00 AM and 5:00 PM on weekdays. Casual riders display a smooth, single afternoon curve peaking at 5:00 PM, with high sustained usage into the late-night hours.

Visualizations were generated in **Tableau* focusing on accessibility guidelines, high contrast elements, and direct descriptive titles.*

---

## 🎯 5. Act Phase (Business Recommendations)
1.  *Launch a "Weekend Warrior" Subscription Tier:* Design a specialized weekend membership package targeting heavy recreational users who account for peak casual volume on Saturdays and Sundays.
2.  *Run an "Own Your Commute" Campaign:* Direct high-impact digital advertising toward afternoon casual riders (3:00 PM – 6:00 PM weekdays). Frame annual membership as a budget-friendly, cost-predictable alternative for routine morning and evening travel.
3.  *Introduce Milestone App Incentives:* Capitalize on electric bike popularity by removing time-rate anxiety for members through dedicated milestone perks (e.g., waived electric unlock fees on trips exceeding 15 minutes).
