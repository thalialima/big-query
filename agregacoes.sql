--AVG retorna a média dos campos agrupados por GROUP BY.
SELECT citibike_trips.gender, AVG(citibike_trips.tripduration/60) AS duration_minutes
FROM `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
GROUP BY citibike_trips.gender
ORDER BY duration_minutes DESC;

SELECT citibike_trips.gender, MAX(citibike_trips.tripduration/60) AS duration_minutes_MAX, 
MIN(citibike_trips.tripduration/60) AS duration_minutes_MIN,SUM(citibike_trips.tripduration/60) AS duration_minutes_MIN,
FROM `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
GROUP BY citibike_trips.gender;

-- COUNT conta o número de ocorrências na base de dados
SELECT citibike_trips.gender, COUNT(*) AS rides, AVG(citibike_trips.tripduration/60) AS duration_minutes
FROM `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
GROUP BY citibike_trips.gender
ORDER BY duration_minutes DESC;

-- Consulta que retorna o número de linhas da tabela
SELECT COUNT(*) FROM `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips;

-- HAVING serve ara fazer filtros de dados que estão vindo de agregações
SELECT citibike_trips.gender, AVG(citibike_trips.tripduration/60) AS duration_minutes_AVG
FROM `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
GROUP BY citibike_trips.gender
HAVING AVG(citibike_trips.tripduration/60) < 18;

-- HAVING com alias
SELECT citibike_trips.gender, AVG(citibike_trips.tripduration/60) AS duration_minutes_AVG
FROM `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
GROUP BY citibike_trips.gender
HAVING duration_minutes_AVG < 20;

-- DISTINCT junta o as linhas repetidas em uma só (retorna um de cada)
SELECT DISTINCT citibike_trips.gender 
FROM `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips;

SELECT citibike_trips.bikeid, citibike_trips.tripduration, citibike_trips.gender 
FROM `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
WHERE gender = ""
LIMIT 100;

SELECT DISTINCT citibike_trips.gender 
FROM `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
WHERE citibike_trips.bikeid IS NOT NULL;

SELECT DISTINCT citibike_trips.gender, citibike_trips.usertype
FROM `bigquery-public-data`.new_york_citibike.citibike_trips citibike_trips
WHERE citibike_trips.bikeid IS NOT NULL;

