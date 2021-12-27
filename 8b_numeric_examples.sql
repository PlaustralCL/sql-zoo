-- https://sqlzoo.net/wiki/NSS_Tutorial

-- Exercise 1
SELECT a_strongly_agree
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science';

-- Exercise 2
SELECT institution, subject
FROM nss
WHERE question = 'Q15'
AND score = 100;

-- Exercise 3
SELECT institution, score
  FROM nss
 WHERE question='Q15'
  AND subject='(8) Computer Science'
  AND score < 50;

-- Exercise 4
SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND (subject = '(H) Creative Arts and Design' OR subject = '(8) Computer Science')
GROUP BY subject;

-- Exercise 5
SELECT subject, SUM((a_strongly_agree * response) / 100) AS total
  FROM nss
 WHERE question='Q22'
   AND (subject = '(H) Creative Arts and Design' OR subject = '(8) Computer Science')
GROUP BY subject;

-- Exercise 6
SELECT subject, ROUND(100 * SUM((a_strongly_agree * response) / 100) / SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (subject = '(H) Creative Arts and Design' OR subject = '(8) Computer Science')
GROUP BY subject;

-- Exercise 7
SELECT institution, ROUND(100 * SUM((score * response) / 100) / SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution;

-- Exercise 8
SELECT institution, SUM(sample), SUM(CASE WHEN subject LIKE '%computer%' THEN sample ELSE 0 END) AS comp
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
GROUP BY institution;
