SELECT DISTINCT url
FROM Topics JOIN Links
ON Topics.topicid = 1 AND Topics.topicid = Links.topicid
ORDER BY 1
;