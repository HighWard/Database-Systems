SELECT DISTINCT W.url, W.title
FROM WebPages W
INNER JOIN Evaluation E1 ON W.url = E1.url
INNER JOIN Evaluation E2 ON W.url = E2.url
INNER JOIN Links L1 ON W.url = L1.url
INNER JOIN Links L2 ON W.url = L2.url
INNER JOIN Topics T1 ON L1.topicid = T1.topicid
INNER JOIN Topics T2 ON L2.topicid = T2.topicid
WHERE E1.email = 'x@a.ca' AND E2.email = 'a@x.ca'
ORDER BY url
;