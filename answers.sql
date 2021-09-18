
--Lesson 6 : Multi-table queries with JOINs

--1.	Find the domestic and international sales for each movie

SELECT title, domestic_sales, international_sales FROM movies JOIN boxoffice
ON movies.id = boxoffice.movie_id;
    
--2.	Show the sales numbers for each movie that did better internationally rather than domestically

SELECT title, domestic_sales, international_sales FROM movies JOIN boxoffice
ON movies.id = boxoffice.movie_id WHERE international_sales > domestic_sales;
    
--3.	List all the movies by their ratings in descending order

SELECT title, rating FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id
ORDER BY rating DESC;


--Lesson 7 : OUTER JOINs

--1.	Find the list of all buildings that have employees

SELECT DISTINCT building FROM employees;

--2.	Find the list of all buildings and their capacity

SELECT * FROM buildings;

--3.	List all buildings and the distinct employee roles in each building (including empty buildings)

SELECT DISTINCT building_name, role FROM buildings Left join employees
 ON building_name = employees.building;
 
 
--Lesson 8 : A short note on NULLs

--1.	Find the name and role of all employees who have not been assigned to a building

SELECT name, role FROM employees where building is null;

--2.	Find the names of the buildings that hold no employees

SELECT DISTINCT building_name FROM buildings left join employees 
ON building_name = employees.building where employees.building IS NULL;


--Lesson 9 : Queries with expressions

--1.	List all movies and their combined sales in millions of dollars

SELECT DISTINCT title, (domestic_sales + international_sales) / 1000000 AS sales
FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id;
    
--2.	List all movies and their ratings in percent

SELECT DISTINCT title,(rating * 10) as rate_percent
FROM movies join boxoffice on movies.id = boxoffice.movie_id;

--3.	List all movies that were released on even number years

SELECT title FROM movies WHERE year % 2 = 0;


--Lesson 10: Queries with aggregates (Pt. 1)

--1.  Find the longest time that an employee has been at the studio 

SELECT max(years_employed) as longest_time FROM employees ;

--2.  For each role, find the average number of years employed by employees in that role

SELECT Role, avg(Years_Employed) FROM Employees group by Role;

--3.  Find the total number of employee years worked in each building

SELECT Building, SUM(Years_Employed) FROM Employees GROUP BY Building;


--Lesson 11: Queries with aggregates (Pt. 2)

--1.	Find the number of Artists in the studio (without a HAVING clause)

SELECT Role, COUNT(*) AS Number_of_Artists FROM Employees WHERE Role = "Artist";

--2.	Find the number of Employees of each role in the studio

SELECT Role, COUNT(*) FROM Employees GROUP BY Role;

--3.	Find the total number of years employed by all Engineers 

SELECT Role, SUM(Years_Employed) FROM employees group by Role having Role="Engineer";


 --Lesson 12: Order of execution of a Query
 
--1.	Find the number of movies each director has directed

SELECT *, COUNT(Title) FROM Movies GROUP BY Director;

--2.  Find the total domestic and international sales that can be attributed to each director

SELECT Director, sum(Domestic_sales + International_Sales) as Total_Sales
FROM Movies left join Boxoffice ON Id = Movie_ID group by Director;

