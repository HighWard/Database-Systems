SELECT DISTINCT url
FROM Links
WHERE topicid IN (SELECT topicid
                  FROM Topics
                  WHERE name = 'computer science')
ORDER BY 1
;