--https://sqlzoo.net/wiki/SQL_Tutorial

-- Problem 3
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- Problem 4
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000;

-- Problem 5
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

-- Problem 6
SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

-- Problem 7
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

-- Problemm 8
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);

-- Problem 9
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

-- Problem 10
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

-- Problem 11
SELECT *
FROM nobel
WHERE winner = 'Peter Grünberg';

-- Problem 12
SELECT *
FROM nobel
WHERE winner = 'Eugene O''Neill';

-- Problem 13
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'SIR%'
ORDER BY yr DESC;

-- Problem 14
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY
   CASE WHEN subject IN ('Physics', 'Chemistry') THEN 1 ELSE 0 END,
   subject,winner;
