-- https://sqlzoo.net/wiki/Using_Null

-- Exercise 1
SELECT name
FROM teacher
WHERE dept IS NULL;


-- Exercise 3
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

-- Exercise 4
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON (teacher.dept = dept.id);

-- Exercise 5
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

-- Exercise 6
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept ON (teacher.dept = dept.id);

-- Exercise 7
SELECT COUNT(name), count(mobile)
FROM teacher;

-- Exercise 8
SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept ON (teacher.dept = dept.id)
GROUP BY dept.name;

-- Exercise 9
SELECT
  name,
  CASE
    WHEN dept = 1 THEN 'Sci'
    WHEN dept = 2 THEN 'Sci'
    ELSE 'Art'
  END
FROM teacher;

-- Exercise 10
SELECT
  name,
  CASE
    WHEN dept = 1 THEN 'Sci'
    WHEN dept = 2 THEN 'Sci'
    WHEN dept = 3 THEN 'Art'
    ELSE 'None'
  END
FROM teacher;
