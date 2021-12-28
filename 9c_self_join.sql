-- https://sqlzoo.net/wiki/Self_join

-- Exercise 1
SELECT COUNT(name)
FROM stops;

-- Exercise 2
SELECT id
FROM stops
WHERE name = 'Craiglockhart';

-- Exercise 3
SELECT id, name
FROM stops
INNER JOIN route ON (stops.id = route.stop)
WHERE num = '4';

-- Exercise 4
SELECT company, num, COUNT(*)
FROM route
WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- Exercise 5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

-- Exercise 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';

-- Exercise 7
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name = 'Leith';

-- Exercise 8
SELECT a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';

-- Exercise 9
-- Two step process:

-- List of busses that stop at Craiglockhart
SELECT num, company, id, name
FROM stops
INNER JOIN route ON (stops.id = route.stop)
WHERE name = 'Craiglockhart';
-- 10, 27, 4, 45, 47

-- List stops reachable from a given bus. This query is not really needed
-- It was a proof aof concept
SELECT num, company, id, name
FROM stops
INNER JOIN route ON (stops.id = route.stop)
WHERE num = '10'; -- specific bus

-- List stops by LRT for all the routes that go to Craiglockhart. This
-- cheats a little by getting the list of busses in a separate query.
SELECT name, company, num
FROM stops
INNER JOIN route ON (stops.id = route.stop)
WHERE num IN ('10', '27', '4', '45', '47') AND company = 'LRT';


-- One query using a nested SELECT as part of the WHERE
SELECT name, company, num
FROM stops
INNER JOIN route ON (stops.id = route.stop)
WHERE company = 'LRT'
  AND num IN (
    SELECT num
    FROM stops
    INNER JOIN route ON (stops.id = route.stop)
    WHERE name = 'Craiglockhart'
   )
ORDER BY num, pos;

-- Using self join
SELECT stop_a.name, route_a.company, route_a.num
FROM route AS route_a
JOIN route AS route_b ON (route_a.company = route_b.company AND route_a.num = route_b.num)
JOIN stops AS stop_a ON (stop_a.id = route_a.stop)
JOIN stops AS stop_b ON (stop_b.id = route_b.stop)
WHERE stop_b.name = 'Craiglockhart'
ORDER BY route_a.num, route_a.pos;

-- Exercise 10
SELECT DISTINCT r1.num, r1.company, s3.name, r4.num, r4.company
FROM route AS r1
  JOIN stops AS s1 ON (s1.id = r1.stop AND s1.name = 'Craiglockhart')
  JOIN route AS r2 ON (r1.company = r2.company AND r1.num = r2.num)
  JOIN route AS r3 ON (r2.stop = r3.stop)
  JOIN stops AS s3 ON (r3.stop = s3.id)
  JOIN route AS r4 ON (r3.company = r4.company AND r3.num = r4.num)
  JOIN stops AS s2 ON (r4.stop = s2.id AND s2.name = 'Lochend')
ORDER BY r1.num, s3.name, r4.num;