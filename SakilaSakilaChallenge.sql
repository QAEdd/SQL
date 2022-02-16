USE SAKILA;

/* 1 */
SELECT First_name, Last_name FROM Actor ORDER BY Last_name ASC;

/* 2 */
SELECT Last_name FROM actor Where First_name ='john';

/* 3 */
SELECT First_name, Last_name 
FROM Actor 
WHERE Last_name = 'neeson' 
ORDER BY First_name ASC;

/* 4 */ 
SELECT Actor_id, First_name, Last_name 
FROM Actor 
WHERE Actor_id LIKE '%0'; 

/* 5 */ 
Select FILm_ID, title, Description 
FROM Film
Where Film_Id = 100;

/* 6 */ 
Select Title
FROM Film
Where Rating ='R';

/* 7 */ 
Select Title
FROM Film
Where Rating !='R';

/* 8 */ 
Select Title, length
FROM Film
ORDER BY length ASC
LIMIT 10;

/* 9 */ 
SELECT Title, length
FROM Film
WHERE length=(
Select Max(Length)
FROM FILM);


/* 10 */ 
Select Title
from film
WHERE Special_features LIKE '%Deleted Scenes%';

/* 11 */ 
/*SELECT DISTINCT Last_Name
FROM ACTOR 
ORDER BY Last_Name Desc;
*/ 

SELECT Last_Name
FROM Actor
group by Last_name
HAVING COUNT(Last_name) < 2
ORDER BY Last_name DESC;

/* 12 */ 
SELECT Last_Name, Count(Last_Name)
FROM Actor
group by Last_name
HAVING COUNT(Last_name) >= 2
ORDER BY COUNT(Last_name) DESC;

/* 13 */ 
SELECT First_name, Last_Name, COUNT(Fa.Actor_ID)
FROM Actor a
Join Film_actor fa
On a.Actor_id=fa.Actor_id
GROUP BY fa.Actor_id
ORDER BY COUNT(FA.actor_ID) DESC LIMIT 1;

/* 14 */ 
SELECT f.Title, rental_date, DATE_ADD(r.rental_date, INTERVAL f.rental_duration day) AS DueDate
FROM Film f
JOIN Inventory i
ON f.film_id=i.film_id
JOIN Rental r
on r.inventory_id=i.inventory_id
Where Title = 'Academy Dinosaur' AND r.return_date IS NULL;

/* 15 */ 
SELECT AVG(Length)
FROM FILM;

/* 16 */ 
SELECT c.name ,AVG(LENGTH)
FROM FILM f
JOIN Film_category fc
on f.film_id=fc.Film_id
JOIN category c
ON fc.category_id=c.category_id
GROUP BY fc.Category_ID
ORDER BY Length desc;

/* 17 */ 
SELECT Title, Description
FROM Film
Where Description LIKE '%robot%';

/* 18 */ 
SELECT COUNT(TITLE)
FROM film
WHERE release_year = 2010;

/* 19 */ 
SELECT Title
FROM FILM f
JOIN Film_category fc
on f.film_id=fc.Film_id
JOIN category c
ON fc.category_id=c.category_id
WHERE c.name = 'horror';

/* 20 */ 

SELECT First_name, Last_name
from Staff
Where staff_ID = 2;

/* 21 */ 
SELECT Title
from FILM f
join film_actor fa
on f.film_id=fa.film_id
join actor a
on a.actor_id=fa.actor_id
WHERE a.First_name = 'Fred' AND a.Last_name = 'Costner';

/* 22 */ 
SELECT DISTINCT COUNT(country)
From Country;

/* 23 */ 
SELECT name
FROM language
ORDER BY name desc;

/* 24 */ 
SELECT First_name, Last_name
FROM actor
Where Last_name LIKE '%SON'
ORDER BY FIRST_NAME ASC;

/* 25 */ 
SELECT C.name, COUNT(fc.category_ID)
FROM FILM f
JOIN Film_category fc
on f.film_id=fc.Film_id
JOIN category c
ON fc.category_id=c.category_id
GROUP BY fc.category_id
ORDER BY COUNT(fc.category_id) DESC;




SELECT * FROM FILM;
SELECT * FROM Film_Category;
Select * from Category;
SELECT * FROM Film_actor;
SELECT * FROM Rental;
SELECT * FROM Inventory;
SELECT * FROM Payment;
SELECT * FROM CUSTOMER;
SELECT * FROM Language;