SELECT DISTINCT url, title
FROM WebPages
JOIN Topics
ON Topics.name = Webpages.title
ORDER BY url
;