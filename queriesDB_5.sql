
--@C:\Users\USER\Desktop\dbas\queriesDB_5.txt
-- setting column size

-- view format
COLUMN city FORMAT A30;
COLUMN street FORMAT A30;
COLUMN country FORMAT A30;


--querifing OBJECT table

SELECT street, city, country FROM ADDRESSES;


--poor method to query locations table
SELECT location_id, location_address
FROM locations;

--okay method to query locations table to view more relevant data
SELECT location_id, DEREF(location_address)
FROM locations;

--best method query location table; DOT NOTATION
SELECT l.location_id, l.location_address.street, l.location_address.city, l.location_address.country
FROM locations l;

--to show how may id are there with location as NASHVILLE.
SELECT l.location_id, l.location_address.street, l.location_address.city, l.location_address.country
FROM locations l
WHERE l.location_address.city = 'NASHVILLE';

--poor method to view the id and address of location table
SELECT location_id, location_address
FROM locations;
--gives oid only

--best method to view the id and address of location table
SELECT l.location_address.street, l.location_address.city, l.location_address.country
FROM locations l;
--gives all the data along with theie coloumn name.

--Query using switch-case in gender
SELECT f.first_name, f.last_name,CASE
								WHEN f.gender = 'M' THEN 'MALE'
								WHEN f.gender = 'F' THEN 'FEMALE'
							END AS gender	
FROM festival_staff f;



--QUERIES USING UNION
--query to show in which city of UK there is music festival
SELECT l.location_address.city
FROM locations l
WHERE l.location_address.country = 'UK'
UNION
SELECT f.festival_name
FROM festivals f
WHERE f.festival_name = 'MUSIC FESTIVAL';

--query using intersect
SELECT l.location_address.city
FROM locations l
WHERE l.location_address.country = 'USA'
INTERSECT
SELECT provision_type
FROM festival_provision
WHERE provision_type = 'UK';


--query using minus
SELECT s.address
FROM festival_staff s
MINUS
SELECT l.location_address.country
FROM locations l; 

--USING MULTIPLE TABLES
SELECT s.address
FROM festival_staff s
UNION
(SELECT l.location_address.country
FROM locations l
UNION
SELECT provision_type
FROM festival_provision p
);
	


--Queries to view festival with dashain and loshar as names
SELECT festival_id, location_id, festival_name
FROM festivals
WHERE festival_name IN('MUSIC FESTIVAL', 'FOOD FESTIVAL');


--Queries to view staff name whose name starts from p
SELECT festival_id, festival_name
FROM festivals
WHERE festival_name LIKE 'M%';

--Queries to view staff whose salary is between 5000-9000
SELECT staff_id, first_name, salary
FROM festival_staff
WHERE salary BETWEEN 500 AND 9000;

--queries to find how many staff are there with use of COUNT
SELECT COUNT(staff_id)
FROM festival_staff;

-- queries to view the average salary of the staff
SELECT  AVG(salary) 
FROM festival_staff;

-- queries to view the total amount spent for the staff
SELECT SUM(salary)
FROM festival_staff;

--query to see the min, maxium and average salary of the staff
SELECT MAX(salary), MIN(salary), AVG(salary)
FROM festival_staff;

--using groupby and having queries

-- Queries to find the number of staff who have salary less than 500
SELECT COUNT(staff_id)
FROM festival_staff
GROUP BY salary
HAVING salary < 500
ORDER BY COUNT(staff_id) DESC;

-- Query after multiple data entry of the same person
SELECT salary 
FROM festival_staff
GROUP BY salary
HAVING AVG(salary) >= 400; 


SELECT staff_id, SUM(salary)
FROM festival_staff
GROUP BY staff_id
ORDER BY SUM(salary) DESC;

-- queries to view the min, max and avg salary for staff's salary
SELECT MAX(salary), MIN(salary), AVG(salary)
FROM festival_staff
GROUP BY salary
HAVING MIN(salary) < 5000
ORDER BY SUM(salary) DESC;


--using join queries

-- without join clause
SELECT s.staff_id , s.festival_id , f.festival_name
FROM festival_staff s, festivals f;

-- showing subject names and titles 
SELECT s.staff_id , s.festival_id , f.festival_name
FROM festival_staff s
JOIN festivals f
ON s.festival_id = f.festival_id;

--join to view staff salary as well
SELECT s.staff_id, s.salary, f.festival_name
FROM festival_staff s
JOIN festivals f
ON s.staff_id = f.festival_id
ORDER BY s.salary ASC;

--joining 3 tables and querying
SELECT s.staff_id, s.salary, f.festival_id, f.festival_name, l.location_name
FROM festival_staff s
JOIN festivals f
ON s.festival_id = f.festival_id
JOIN locations l
ON l.location_id = f.festival_id;



-- using LEFT outer join
SELECT s.festival_id, s.first_name, s.last_name, f.festival_name
FROM festival_staff s 
LEFT JOIN festivals f 
ON s.festival_id = f.festival_id;

-- using RIGHT outer join
SELECT s.festival_id, s.first_name, s.last_name, f.festival_name
FROM festivals f
RIGHT JOIN festival_staff s  
ON s.festival_id = f.festival_id;


--joining three tables using FULL JOIN
SELECT s.staff_id, s.salary, f.festival_id, l.location_name
FROM festival_staff s
FULL JOIN festivals f
ON s.festival_id = f.festival_id
FULL JOIN locations l
ON l.location_id = f.festival_id;

-- showing list of students working in Amsterdam


--subqueries


SELECT f.festival_name
FROM festivals f
WHERE f.location_id IN(
	SELECT location_id 
	FROM locations l
	WHERE l.location_address.city ='BLUFFTON');
	
-- showing list of festival from kathmandu 

SELECT l.location_address.city, l.location_address.country, f.festival_name
FROM locations l, festivals f 
WHERE l.location_address.city IN(
		SELECT l.location_address.city
		FROM festivals f
		WHERE f.festival_name='MUSIC FESTIVAL');
		

SELECT fp.price, fp.provision_type
	FROM festival_provision fp
	WHERE fp.price > '1000';

--showing list of location which price to book is more than 1000
		

--NOT IN

SELECT s.first_name, s.salary
FROM festival_staff s
WHERE s.salary NOT IN ('500');

SELECT f.festival_name, f.festival_id
FROM festivals f
WHERE f.festival_name NOT IN(
		SELECT l.location_name
		FROM locations l);

--as there is no festival in location it shows every festival
SELECT f.staff_id,f.festival_id, f.first_name,f.last_name, f.salary 
FROM festival_staff f
WHERE EXISTS(
	SELECT staff_id 
	FROM festival_staff fs
	WHERE f.festival_id IS NOT NULL
	AND f.festival_id = fs.staff_id);
 

--query using & ampersand
SELECT f.festival_name, f.festival_id
FROM festivals f
WHERE f.festival_name LIKE &festival_name;