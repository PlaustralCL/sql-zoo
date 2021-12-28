-- https://sqlzoo.net/wiki/Window_functions

-- Exercise 4
SELECT constituency,party, votes, RANK() OVER(PARTITION BY constituency ORDER BY votes DESC) AS posn
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY posn, constituency,votes DESC;

-- Exercise 5
SELECT constituency, party
FROM (
  SELECT constituency, party, votes, RANK() OVER(PARTITION BY constituency ORDER BY votes DESC)as posn
    FROM ge
   WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
     AND yr  = 2017
   ORDER BY constituency,votes DESC
   ) AS new_table
WHERE posn = 1;

-- Exercise 6
SELECT party, COUNT(firstname)
FROM (
  SELECT constituency, firstname, party, votes, RANK() OVER(PARTITION BY constituency ORDER BY votes DESC)as posn
    FROM ge
   WHERE constituency LIKE 's%'
     AND yr  = 2017
   ORDER BY constituency,votes DESC
   ) AS new_table
WHERE posn = 1
GROUP BY party
ORDER by party;
