-- https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

-- Exercise 2
SELECT name
FROM world
WHERE continent = 'Europe' AND gdp / population >
  (SELECT gdp / population FROM world WHERE name = 'United Kingdom');

-- Exercise 3
SELECT name, continent
FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina') OR
    continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name ASC;

-- Exercise 4
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND
    population < (SELECT population FROM world WHERE name = 'Poland');

-- Exercise 5
SELECT name, CONCAT(ROUND(population * 100 / (SELECT population FROM world WHERE name = 'Germany')),'%') AS percentage
FROM world
WHERE continent = 'Europe';

-- Exercise 6
SELECT name
FROM world
WHERE gdp > ALL (SELECT gdp FROM world WHERE gdp > 0 AND continent = 'Europe');

-- Exercise 7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent

-- Exercise 8
SELECT continent, name
FROM world x
WHERE name <= ALL
    (SELECT name FROM world y WHERE y.continent = x.continent);

-- Exercise 9
SELECT name, continent, population
FROM world x
WHERE 25000000 >= ALL
    (SELECT population
    FROM world y
    WHERE x.continent = y.continent);

-- Exercise 10
SELECT name, continent
FROM world x
WHERE population > ALL
    (SELECT 3 * population FROM world y where y.continent = x.continent AND x.name <> y.name);
