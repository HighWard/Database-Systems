ratings = LOAD '/data/ratings.csv' USING PigStorage(',') AS (userid:INT, movieid:INT, rating:FLOAT, timestamp:INT);

Grp = GROUP ratings BY movieid;

count = FOREACH Grp GENERATE group AS mID, COUNT(ratings.rating) AS nRatings;

movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);
Grp2 = GROUP movies BY movieid;

joined = JOIN count BY mID, Grp2 BY group;
ordered = ORDER joined BY nRatings DESC;
top = LIMIT ordered 10;
projection = FOREACH top GENERATE FLATTEN(Grp2::movies.title) AS title, count::nRatings AS nRatings;

DUMP projection;






