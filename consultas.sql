SELECT gender, tripduration/60 AS duration_minutes
FROM  `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
WHERE citibike_trips.tripduration < 600
LIMIT 5;

SELECT gender, tripduration/60 AS duration_minutes
FROM  `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
WHERE citibike_trips.tripduration < 600 AND citibike_trips.tripduration >= 300
AND citibike_trips.gender = 'female'
LIMIT 5;

SELECT gender, tripduration AS duration_minutes
FROM  `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
WHERE (citibike_trips.tripduration < 600 AND citibike_trips.gender = 'female') 
OR citibike_trips.gender = 'male'
LIMIT 5;

SELECT gender, tripduration AS duration_minutes
FROM `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
WHERE NOT((citibike_trips.tripduration < 600 AND citibike_trips.gender = 'female')) 
OR citibike_trips.gender = 'male'
LIMIT 5;

-- Não é possível usar alias no filtro (WHERE)
-- SELECT gender, tripduration/60 AS duration_minutes
-- FROM  `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
-- WHERE duration_minutes < 600
-- LIMIT 5;

SELECT gender, tripduration/60 AS duration_minutes
FROM  `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
WHERE (citibike_trips.tripduration/60) < 600
LIMIT 5;

-- A não ser que o alias esteja em uma subquery
SELECT * FROM (SELECT gender, tripduration/60 AS duration_minutes
FROM  `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips) 
WHERE duration_minutes < 10
LIMIT 5;

WITH all_trips AS (SELECT gender, tripduration/60 AS duration_minutes
FROM  `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips)
SELECT * FROM all_trips WHERE duration_minutes  < 10
LIMIT 5;

SELECT citibike_trips.gender, citibike_trips.tripduration/60 AS duration_minutes
FROM  `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
WHERE citibike_trips.gender = 'female'
ORDER BY duration_minutes DESC 
LIMIT 5;

