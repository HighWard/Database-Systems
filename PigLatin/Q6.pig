movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);

Grpd1 = GROUP movies BY year;
Grpd2 = GROUP movies BY year;

nMovies1 = FOREACH Grpd1 GENERATE group AS year, FLATTEN(COUNT(movies.movieid)) AS nMovies;
nMovies2 = FOREACH Grpd2 GENERATE group AS year, FLATTEN(COUNT(movies.movieid)) AS nMovies;

joined = JOIN nMovies1 BY year - 1, nMovies2 BY year;

filtered = FILTER joined BY nMovies1::nMovies < nMovies2::nMovies;

projection = FOREACH filtered GENERATE nMovies1::year, nMovies1::nMovies, nMovies2::nMovies;

DUMP projection;
