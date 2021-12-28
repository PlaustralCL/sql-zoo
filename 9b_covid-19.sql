--https://sqlzoo.net/wiki/Window_LAG

-- Exercise 2
SELECT name, DAY(whn), confirmed,
   LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn;

-- Exercise 3
SELECT name, DAY(whn), confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn;


-- Exercise 4
SET @@sql_mode='ANSI';
SELECT name, DATE_FORMAT(whn,'%Y-%m-%d'), confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND WEEKDAY(whn) = 0 AND YEAR(whn) = 2020
ORDER BY whn;

-- Exercise 5
SET @@sql_mode='ANSI';

SELECT tw.name, DATE_FORMAT(tw.whn,'%Y-%m-%d'),
 tw.confirmed -lw.confirmed
FROM covid AS tw
LEFT JOIN covid AS lw
  ON
    DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn
     AND tw.name=lw.name
WHERE tw.name = 'Italy'
  AND WEEKDAY(tw.whn) = 0
ORDER BY tw.whn;

-- Exercise 6
SET @@sql_mode='ANSI';

SELECT
   name,
   confirmed,
   RANK() OVER (ORDER BY confirmed DESC) AS rank_confirmed,
   deaths,
   RANK() OVER (ORDER BY deaths DESC) AS rank_deaths
  FROM covid
WHERE whn = '2020-04-20'
ORDER BY confirmed DESC;

-- Exercise 7
SET @@sql_mode='ANSI';
SELECT
   world.name,
   ROUND(100000*confirmed/population,0),
   RANK() OVER(ORDER BY confirmed/population) AS infect_rank
FROM covid
JOIN world ON covid.name=world.name
WHERE whn = '2020-04-20' AND population > 10000000
ORDER BY population DESC;

-- Exercise 8
SET @@sql_mode='ANSI';
SELECT name, DATE_FORMAT(whn,'%Y-%m-%d'), new_cases AS peakNewCases

-- Rank new cases to find each countries peak
FROM (
  SELECT name, whn, new_cases, RANK() OVER(PARTITION BY name ORDER BY new_cases DESC) AS rank

-- Days with more than 1000 new cases
  FROM (
    SELECT
      name,
      whn,
      DAY(whn),
      confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS new_cases
    FROM covid
    ORDER BY whn
  ) AS sub_table
  WHERE new_cases >= 1000

) AS ranking_table

WHERE rank = 1
ORDER BY whn, peakNewCases DESC;
