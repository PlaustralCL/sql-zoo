-- https://sqlzoo.net/wiki/SELECT_names

-- Problem 12
SELECT name
  FROM world
WHERE capital = concat(name, ' city');

-- Problem 13
SELECT capital, name
FROM world
WHERE capital LIKE concat('%', name, '%');

-- Problem 14
SELECT capital, name
FROM world
WHERE capital LIKE concat('%', name, '%')
AND capital <> name;

-- Problem 15
SELECT name, REPLACE(capital, name, '') AS ext
FROM world
WHERE capital LIKE concat('%', name, '%') AND name <> capital;
