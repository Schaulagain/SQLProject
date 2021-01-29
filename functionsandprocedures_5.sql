--@C:\Users\USER\Desktop\dbasfunctionsandprocedures_5.txt

SET SERVEROUTPUT ON;


--CREATING A PROCEDURE FOR INSERTION IN FESTIVAL TABLE
CREATE OR REPLACE PROCEDURE proc_param_festivals(in_location_id festivals.location_id%TYPE,in_festival_name festivals.festival_name%TYPE,in_festival_duration festivals.festival_duration%TYPE) IS
BEGIN
INSERT INTO festivals(festival_id, location_id, festival_name, festival_duration)
VALUES (seq_festivals.NEXTVAL,in_location_id,in_festival_name,in_festival_duration);

DBMS_OUTPUT.PUT_LINE(in_festival_name ||' ADDED SUCCESFULLY');
END proc_param_festivals;

/

--Creating a procedure for insertion in addresses object table
CREATE OR REPLACE PROCEDURE proc_param_addresses(in_street addresses.street%TYPE,in_city addresses.city%TYPE,in_country addresses.country%TYPE) IS
BEGIN
INSERT INTO addresses(street,city,country) 
VALUES(in_street,in_city,in_country);

DBMS_OUTPUT.PUT_LINE(' ADDRESS UPDATED SUCCESFULLY');
END proc_param_addresses;
/

--Creating a function for counting number of staffs

CREATE OR REPLACE FUNCTION func_staff_count RETURN NUMBER IS 
vn_staff_count NUMBER(9);

BEGIN 
SELECT COUNT (*) INTO vn_staff_count
FROM festival_staff;

RETURN vn_staff_count;
END func_staff_count;
/


CREATE OR REPLACE PROCEDURE proc_count_staff IS
	vn_staffn NUMBER(9);
BEGIN
	vn_staffn := func_staff_count;
	DBMS_OUTPUT.PUT_LINE ('There are ' || vn_staffn || ' staffs in the database.');
	
	EXCEPTION
				WHEN NO_DATA_FOUND THEN
				DBMS_OUTPUT.PUT_LINE('There are no staffs currently volunteering.');
	
END proc_count_staff;
/ 


-- Function to calculate the working years of staffs.

		CREATE OR REPLACE FUNCTION func_working_age (vd_year DATE) RETURN NUMBER IS
			vn_age NUMBER(3);
		BEGIN
			vn_age := FLOOR(MONTHS_BETWEEN(SYSDATE, vd_year)/12);	
			RETURN vn_age;
		END func_working_age;
		/
		SHOW ERRORS;
	-- Creating Procedure 
		CREATE OR REPLACE PROCEDURE proc_working_age(in_fname festival_staff.first_name%TYPE) IS 
			vn_time NUMBER(3);
			vn_year DATE;
		BEGIN
			SELECT f.date_of_recruitment 
			INTO vn_year
			FROM festival_staff f
			WHERE f.first_name = in_fname;
			
			vn_time := func_working_age (vn_year);
			DBMS_OUTPUT.PUT_LINE (in_fname || '  started working' || vn_time ||'  years ago');
			
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
				DBMS_OUTPUT.PUT_LINE('There are no staffs under the name: '||in_fname);
		END proc_working_age ;	
		/
		SHOW ERRORS;
		
		--Function to search a staff
		
		
		CREATE OR REPLACE FUNCTION func_person_search(in_fname festival_staff.first_name%TYPE, in_lname festival_staff.last_name%TYPE) RETURN VARCHAR2 IS
			vn_boolean VARCHAR2(5);
		BEGIN
			SELECT 'TRUE'
			INTO vn_boolean
			FROM festival_staff f
			WHERE f.first_name = in_fname AND f.last_name = in_lname;
			
			RETURN vn_boolean;
			
			-- EXCEPTION
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					vn_boolean := 'FALSE';
			return vn_boolean;	
		END func_person_search;
		/
		
		SHOW ERRORS;
		--Procedure for displaying person name
		
		CREATE OR REPLACE PROCEDURE proc_person_display(in_fname festival_staff.first_name%TYPE, in_lname festival_staff.last_name%TYPE) IS	
				vn_fullname VARCHAR2(9);
				vn_search VARCHAR(5);
		BEGIN
			vn_search := func_person_search(in_fname, in_lname);
			IF vn_search = 'TRUE' THEN
				SELECT CONCAT(INITCAP(SUBSTR(f.first_name,1,3)),(SUBSTR(f.last_name,1,3)))
				INTO vn_fullname
				FROM festival_staff f
				WHERE f.first_name = in_fname AND f.last_name = in_lname;
				DBMS_OUTPUT.PUT_LINE('Staff Found as = '|| vn_fullname );
			ELSE		
				DBMS_OUTPUT.PUT_LINE('Staff not found');	
			END IF;	
		END proc_person_display;
		/	
		SHOW ERRORS;

--CREATING procedure using currval
CREATE OR REPLACE PROCEDURE proc_del_cur_festival_staff IS
	vn_festival_staff_id festival_staff.staff_id%TYPE;
BEGIN
	SELECT seq_festival_staff.currval 
	INTO vn_festival_staff_id 
	FROM DUAL;
	
	DELETE FROM festival_staff
	WHERE staff_id = vn_festival_staff_id;
	DBMS_OUTPUT.PUT_LINE('Deleted record with staff_id '||vn_festival_staff_id);

END proc_del_cur_festival_staff;
/
SHOW ERRORS;	

		
 