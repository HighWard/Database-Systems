SELECT DISTINCT T.topicid, COUNT(L.url) AS numlinks
FROM Topics T
LEFT JOIN Links L ON T.topicid = L.topicid
GROUP BY T.topicid
ORDER BY T.topicid
;