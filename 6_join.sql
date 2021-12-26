-- https://sqlzoo.net/wiki/The_JOIN_operation

-- Exercise 1
SELECT matchid, player
FROM goal
WHERE teamid = 'GER';

-- Exercise 2
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;

-- Exercise 3
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER';


-- Exercise 4;
SELECT team1, team2, player
FROM game JOIN goal ON (id = matchid)
WHERE player LIKE 'Mario%';

-- Exercise 5
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (id = teamid)
WHERE gtime <= 10;

-- Exercise 6
SELECT mdate, teamname
FROM game JOIN eteam ON(team1 = eteam.id)
WHERE coach = 'Fernando Santos';

-- Exercise 7
SELECT player
FROM goal JOIN game ON (id = matchid)
WHERE stadium = 'National Stadium, Warsaw';

-- Exercise 8
SELECT DISTINCT player
FROM game JOIN goal ON matchid = id
WHERE ((team1='GER' OR team2='GER') AND teamid <> 'GER');

-- Exercise 9
SELECT teamname, COUNT(gtime)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname;

-- Exercise 10
SELECT stadium, COUNT(gtime)
FROM game JOIN goal ON (game.id = goal.matchid)
GROUP BY stadium;

-- Exercise 11
SELECT id, mdate, COUNT(gtime)
FROM game JOIN goal ON (goal.matchid = game.id)
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY id, mdate;

-- Exercise 12
SELECT id, mdate, COUNT(gtime)
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE teamid = 'GER'
GROUP BY id, mdate;

-- Exercise 13
SELECT
  mdate,
  team1,
  SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) score2
FROM game JOIN goal ON goal.matchid = game.id
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2;
