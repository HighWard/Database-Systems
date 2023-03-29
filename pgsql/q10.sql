SELECT DISTINCT W.url, W.title
FROM Webpages W
INNER JOIN Links L1 ON W.url = L1.url
INNER JOIN Links L2 ON L1.url = L2.url AND L1.topicid != L2.topicid
ORDER BY W.url
;