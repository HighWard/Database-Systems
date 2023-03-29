SELECT DISTINCT T.topicid, T.name
FROM Topics T
JOIN Links L ON T.topicid = L.topicid
GROUP BY T.topicid, T.name
HAVING COUNT(DISTINCT L.url) = (SELECT COUNT(*) FROM Webpages)
ORDER BY T.topicid ASC;