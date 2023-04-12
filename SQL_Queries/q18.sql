SELECT E.url, COUNT(*) AS numevaluations
FROM Evaluation E
GROUP BY E.url
ORDER BY numevaluations DESC
LIMIT 1
;