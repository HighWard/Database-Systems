SELECT AVG(num_links) AS avgnumlinks
FROM (SELECT COUNT(*) AS num_links
      FROM Links
      GROUP BY topicid) AS link_counts
;