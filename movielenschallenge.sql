use Movielens;

/* 1 */

SELECT Title, release_date
from movies
WHERE release_date BETWEEN '1983-01-01' AND '1993-12-31';

/* 2 */
SELECT Title, AVG(rating)
FROM Movies m
join ratings r
on m.id=r.movie_id
GROUP BY Movie_id
Order By AVG(rating);

/* 3 */
SELECT DISTINCT Title, g.name
FROM Movies m
Join ratings r
on m.id=r.movie_id
join users u
on u.id=r.user_id
join genres_movies gm
on m.id=gm.movie_id
join genres g
on g.id=gm.genre_id
WHERE u.gender = 'm' AND u.age = 24 AND R.Rating = 5 AND G.name = 'sci-fi';

/* 4 */
SELECT Title, release_date
FROM movies
GROUP BY Release_date
ORDER BY COUNT(RELEASE_DATE);

/* 5 */
SELECT g.name, COUNT(TITLE)
FROM Movies m
JOIN genres_movies gm
on m.id=gm.movie_id
join genres g
on g.id=gm.genre_id
GROUP BY g.name
ORDER BY COUNT(TITLE) ASC;

SELECT * from MOVIES;
SELECT * FROM RATINGS;
SELECT * FROM Users;