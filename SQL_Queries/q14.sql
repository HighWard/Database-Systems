SELECT DISTINCT T.topicid, COUNT(L.url) AS numlinks
FROM Topics T
INNER JOIN Links L ON T.topicid = L.topicid
GROUP BY T.topicid
ORDER BY T.topicid
;