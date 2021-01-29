--@C:\Users\USER\Desktop\dbas\test_script_cursors.txt

--TESTING IMLICIT CURSER 
EXEC proc_imp_cursor('NOT FOUND');
--PLACE NOT FOUND

SELECT location_id,location_name FROM locations;
--7 rows selected

--INSERTING into locations table
INSERT INTO locations(location_id, location_name) 
VALUES(seq_locations.NEXTVAL, 'BRISTOL');
--1 row created

SELECT location_id,location_name FROM locations;
--8 rows selected

--EXECUTING procedure
EXEC proc_imp_cursor('BRISTOL');
--BRISTOL DELETED

SELECT location_id,location_name FROM locations;
--7 rows selected

--Viewing festival_staff
DESC festival_staff;



--TESTING PROCEDURE
SELECT first_name, salary FROM festival_staff;
--4 rows selected

EXEC proc_exp_festival_staff_cursor(50000.02);
--THERE ARE 2 ROWS IN THE DATABASE

EXEC proc_exp_festival_staff_cursor(90000);
--no rows


--Viewing location_provision_table
DESC location_provision;


--TESTING PROCEDURE
SELECT location_provision_id,provision_type,price FROM location_provision;
--4 rows selected

--EXECUTING procedure
EXEC proc_exp_location_provision_cursor(3000);
--THERE ARE 2 ROWS IN THE DATABASE



EXEC proc_exp_location_provision_cursor(6000);
--LOCATION PROVISION NOT FOUND


-