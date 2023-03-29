SELECT DISTINCT T.topicid, COUNT(L.url) as numlinks
FROM Topics T, Links L
WHERE T.topicid = L.topicid
GROUP BY T.topicid
ORDER BY T.topicid
;