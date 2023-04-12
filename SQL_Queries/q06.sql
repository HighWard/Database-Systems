SELECT DISTINCT W.url, title
FROM WebPages W
WHERE W.url NOT IN (SELECT url
                    FROM Evaluation
                    WHERE extract(year from evaldate) <= '2006')
ORDER BY W.url
;