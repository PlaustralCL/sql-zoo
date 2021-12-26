-- https://sqlzoo.net/wiki/More_JOIN_operations

-- Exercise 6
SELECT actor.name
FROM casting
  INNER JOIN movie ON (movie.id = casting.movieid)
  INNER JOIN actor ON (actor.id = casting.actorid)
WHERE movieid = 11768;

-- Exercise 7
SELECT actor.name
FROM actor
  INNER JOIN casting ON (actor.id = casting.actorid)
  INNER JOIN movie ON (movie.id = casting.movieid)
WHERE movie.title = 'Alien';

-- Exercise 8
SELECT movie.title
FROM movie
  INNER JOIN casting ON (movie.id = casting.movieid)
  INNER JOIN actor ON (actor.id = casting.actorid)
WHERE actor.name = 'Harrison Ford';

-- Exercise 9
SELECT movie.title
FROM movie
  INNER JOIN casting ON (movie.id = casting.movieid)
  INNER JOIN actor ON (actor.id = casting.actorid)
WHERE actor.name = 'Harrison Ford' AND casting.ord <> 1;

-- Exercise 10
SELECT movie.title, actor.name
FROM movie
  INNER JOIN casting ON (movie.id = casting.movieid)
  INNER JOIN actor ON (actor.id = casting.actorid)
WHERE yr = 1962 AND ord = 1;

-- Exercise 11
SELECT yr,COUNT(title)
FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor   ON casting.actorid = actor.id
WHERE actor.name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- Exercise 12
SELECT title, name
FROM movie
  INNER JOIN casting ON (movie.id = casting.movieid)
  INNER JOIN actor ON (actor.id = casting.actorid)
WHERE movieid IN (
  SELECT movieid FROM casting
    WHERE actorid IN (
      SELECT id FROM actor
      WHERE name='Julie Andrews')
      )
  AND ORD = 1;

-- Exercise 13
SELECT actor.name
FROM actor
  INNER JOIN casting ON (actor.id = casting.actorid)
WHERE ord = 1
GROUP BY actor.name
HAVING COUNT(actor.name) >= 15;

-- Exercise 14
SELECT title, COUNT(actorid)
FROM movie
  INNER JOIN casting ON (movie.id = casting.movieid)
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title;

-- Exercise 15
SELECT name
FROM actor
  INNER JOIN casting ON (actor.id = casting.actorid)
WHERE movieid IN (
  SELECT movieid FROM casting
    WHERE actorid IN (
      SELECT id FROM actor
      WHERE name = 'Art Garfunkel'))
  AND name <> 'Art Garfunkel';
