SELECT DISTINCT E.url
FROM Evaluation E
WHERE E.email = 'x@a.ca'
  AND E.url NOT IN (
    SELECT T.url
    FROM Evaluation T
    WHERE T.email != 'x@a.ca'
    )
ORDER BY E.url
;
