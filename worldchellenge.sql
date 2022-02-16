USE WORLD;
Select * from CITY;
select * from country;
SELECT * FROM CountryLanguage;

/* 1 */
SELECT COUNT(Name) 
FROM City 
WHERE CountryCode = 'USA';

/* 2 */
SELECT Population, LifeExpectancy 
FROM Country 
WHERE name= 'Argentina';

/* 3 */
SELECT LifeExpectancy, Name
FROM Country 
WHERE LifeExpectancy IS NOT NULL 
ORDER BY LifeExpectancy DESC LIMIT 1;

/* 4 */
SELECT Ci.name FROM City Ci 
JOIN Country Co 
on ci.CountryCode=Co.Code 
WHERE Ci.ID=(
	SELECT Co.Capital 
    WHERE Co.name = 'spain'
);


/* 5 */
SELECT CL.Language 
FROM Country Co 
JOIN CountryLanguage Cl 
on Co.Code=Cl.CountryCode 
WHERE Co.Region ='Southeast Asia';


/* 6 */
SELECT Name 
FROM City 
WHERE Name 
LIKE 'F%' 
LIMIT 25 ;

/* 7 */
SELECT COUNT(Ci.Name) 
FROM City Ci 
JOIN Country Co 
on ci.CountryCode=Co.Code 
WHERE Co.Name ='China';

/* 8 */
SELECT Population, Name
FROM Country 
WHERE Population IS NOT NULL 
AND Population != 0 
ORDER BY Population ASC LIMIT 1;

/* 9 */
SELECT COUNT(DISTINCT Name) 
FROM Country;

/* 10 */
SELECT Name, SurfaceArea 
FROM Country 
ORDER BY SurfaceArea DESC 
LIMIT 10;

/* 11 */
SELECT Ci.name, Ci.Population FROM City Ci 
JOIN Country Co 
on ci.CountryCode=Co.Code 
WHERE Co.Name='Japan' 
LIMIT 5;

/* 12 */
/* set sql_safe_updates=0;
UPDATE Country
SET HeadOfState='Elizabeth II' 
WHERE HeadOfState='Elisabeth II'; */
SELECT Name, Code 
FROM Country 
WHERE HeadOfState='Elizabeth II';

/* 13 */
SELECT Name, Population / SurfaceArea AS SurfPop
FROM Country 
WHERE Population / SurfaceArea !=0
ORDER BY SurfPop ASC LIMIT 10;

/* 14 */
SELECT COUNT(DISTINCT Language) 
FROM CountryLanguage;

/* 15 */
SELECT Name, GNP 
FROM Country 
ORDER BY GNP DESC LIMIT 10;

/* 16 */
SELECT DISTINCT Co.Name, COUNT(CL.Language)
FROM Country Co
JOIN CountryLanguage CL on Co.Code=Cl.CountryCode
GROUP BY Cl.Language
ORDER BY Count(Cl.Language) DESC LIMIT 10;

/* 17 */
SELECT CO.Name, CL.Percentage
FROM Country Co
JOIN CountryLanguage CL on Co.Code=Cl.CountryCode
WHERE CL.Language ='german' AND CL.Percentage >= 50;

/* 18 */
SELECT LifeExpectancy, Name
FROM Country 
WHERE LifeExpectancy IS NOT NULL 
ORDER BY LifeExpectancy ASC LIMIT 1;

/* 19 */
SELECT GovernmentForm 
FROM Country
GROUP BY GovernmentForm 
ORDER BY GovernmentForm ASC LIMIT 3;

/* 20 */
SELECT COUNT(IndepYear)
FROM Country
WHERE IndepYear IS NOT NULL;