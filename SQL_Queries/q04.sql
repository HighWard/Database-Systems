SELECT DISTINCT W.url, W.title
FROM Links
JOIN Topics ON Topics.name = 'computer science' AND Topics.topicid = Links.topicid
JOIN WebPages W ON W.url = Links.url
ORDER BY W.url
;
