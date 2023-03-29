SELECT DISTINCT W.url, W.title
FROM Webpages W
INNER JOIN Links L ON W.url = L.url
GROUP BY W.url, W.title
HAVING COUNT(DISTINCT L.topicid) >= 2
ORDER BY W.url
;