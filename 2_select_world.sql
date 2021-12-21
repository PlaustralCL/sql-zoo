-- Problem 3
SELECT name, gdp / population AS per_capita_GDP
FROM world
WHERE population >= 200000000;

-- Problem 4
SELECT name, population / 1000000 AS population_in_millions
FROM world
WHERE continent = 'South America';

-- Problem 5
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- Problem 6
SELECT name
FROM world
WHERE name LIKE '%United%';

-- Problem 7
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

-- Problem 8
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000;

-- Problem 9
SELECT name, ROUND(population / 1000000, 2) AS population_in_millions, ROUND(GDP / 1000000000, 2) AS GDP_in_billions
FROM world
WHERE continent = 'South America';

-- Problem 10
SELECT name, Round((GDP / population) / 1000, 0) * 1000 AS per_capita_GDP
FROM world
WHERE GDP >= 1000000000000;

--Problem 11
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital);

-- Problem 12
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital;

-- Problem 13
SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%'
AND name NOT LIKE '% %';

-- Problem 14

