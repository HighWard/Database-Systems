SELECT DISTINCT url
FROM Evaluation
WHERE email = 'x@a.ca'
EXCEPT
SELECT url
FROM Evaluation
WHERE email != 'x@a.ca'
ORDER BY url;