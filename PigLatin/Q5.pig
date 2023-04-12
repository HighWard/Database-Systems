movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);

filtered = FILTER movies BY year == 2015 OR year == 2016;

genres = LOAD '/data/moviegenres.csv' USING PigStorage(',') AS (movieid:INT, name:CHARARRAY);

joined = JOIN filtered BY movieid, genres by movieid;

Grpd1 = GROUP joined BY (genres::name, filtered::year);

projection = FOREACH Grpd1 GENERATE group.genres::name, group.filtered::year,COUNT(joined.filtered::movieid);

ordered = ORDER projection BY ($0), ($1);

DUMP ordered;
